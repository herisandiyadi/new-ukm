

import 'package:flutter/material.dart';

class ListCompany extends StatefulWidget {
  const ListCompany({Key? key}) : super(key: key);

  @override
  _ListCompanyState createState() => _ListCompanyState();
}

class _ListCompanyState extends State<ListCompany> {
  int selectedIndex = -1;
  late String idPerusahaan;
  Datum datum;

  CompanyRepository companyRepository = CompanyRepository();
  @override
  // void initState() {
  //   final profileBloc = context.bloc<ProfileCubit>();
  //   super.initState();
  //   profileBloc.profile();
  // }

  @override
  Widget build(BuildContext context) {
    Widget listCompany(Datum datums, int index) {
      return InkWell(
        onTap: () {
          setState(() {
            print(datums.id);
            selectedIndex = index;
            idPerusahaan = datums.id.toString();
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datums.npwp,
                        style: darkTextStyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        datums.name,
                        style: darkTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        datums.address,
                        style: darkTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: selectedIndex == index ? whiteColor : softGreyColor,
            border: Border.all(
              color: selectedIndex == index ? redColor : softGreyColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text(
          'UKM Desk',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.14,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  'Daftar Perusahaan',
                  style: darkTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddCompany(),
                            ),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FutureBuilder<List<Datum>>(
                future: companyRepository.getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Datum> datums = snapshot.data;
                    return ListView.builder(
                        itemCount: datums.length,
                        itemBuilder: (context, index) {
                          final data = datums[index];
                          print(data.name);
                          return listCompany(data, index);
                        });
                  }
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          onPressed: () {
            companyRepository.selectCompany(idPerusahaan);
            final snackbar = SnackBar(
              backgroundColor: greenColor,
              duration: Duration(seconds: 1),
              content: Text(
                'Data perusahaan telah dipilih',
                textAlign: TextAlign.center,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            Navigator.of(context).pop();
            // Navigator.of(context).pop();
          },
          child: Text(
            'Pilih',
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(redColor),
          ),
        ),
      ),
    );
  }
}
