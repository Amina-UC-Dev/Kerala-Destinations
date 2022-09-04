import 'dart:async';
import 'dart:io';
import 'package:destinations/models/destination_detail_model.dart';
import 'package:destinations/models/destination_types_model.dart';
import 'package:destinations/models/detination_list_model.dart';
import 'package:destinations/screens/temples/local_temples.dart';
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:destinations/models/countries_model.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/providers/database_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/screens/dashboard/dashboard.dart';
import 'package:destinations/screens/no_network.dart';
import 'package:destinations/services/api.dart';
import 'package:destinations/services/api_url.dart';
import 'package:destinations/services/shared_pref.dart';
import 'package:destinations/widgets/commonWidget.dart';

class TempleProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  DestinationListResponse? destinationList;
  List<DestinationLD> localDestination = [];
  List<DestinationLD>? localDestination2;
  List<DestinationD>? searchResult;
  DestinationListResponse? nearDestinationList;
  DestinationDetailResponse? destinationDetail;
  int destinationImagesLength = 0;
  List<String> destinationImages = [];
  // TempleTypes? templeTypes;
  // Countries? countries;
  List<Country> countriesList = [];
  List<States> statesList = [];
  List<DestinationTypeData> typesList = [];
  String? sortColumn;
  String? sortDirection;
  String? selectedDestinationType;
  String? selectedCountry;
  String? selectedState;
  String? selectedImage;
  String? selectedImage1;
  String? selectedImage2;
  String? selectedImage3;
  String? selectedImage4;
  String? templeImage;
  String? templeImage1;
  String? templeImage2;
  String? templeImage3;
  String? templeImage4;
  String? templeId;
  List<String> otherImages = [];
  List<String> otherDestinationImages = [];
  ScrollController? scrollController;
  bool editDest = false;
  TextEditingController templeName = TextEditingController();
  TextEditingController templeLocalName = TextEditingController();
  TextEditingController templeLocation = TextEditingController();
  TextEditingController templeCity = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController imageCourtesy = TextEditingController();
  TextEditingController bestSeason = TextEditingController();
  TextEditingController destAttraction = TextEditingController();
  TextEditingController templeDescription = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  ScrollController? controller1;
  ScrollController? controller2;
  int page1 = 0;
  int page2 = 0;
  bool showMoreTempleLoader1 = false;
  bool showMoreTempleLoader2 = false;
  bool isSearching1 = false;
  bool isSearching2 = false;
  bool showMoreTemple1 = false;
  bool showMoreTemple2 = false;
  int selectedSort = 0;

  List<String> sortColumnList = [
    "Destination Type",
    "Destination Name",
    "Destination City",
    "Zip Code",
    "Best Season",
  ];

  List<String> sortDirectionList = [
    "Ascending",
    "Descending",
  ];

  setSort({required int val, required String sortBy, required String direction}){
    selectedSort = val;
    sortColumn = sortBy;
    sortDirection = direction;
    notifyListeners();
  }

  clearSearch(BuildContext context){
    reset(context: context);
    getDestinations(context: context);
    notifyListeners();
  }

  clearSearch2(BuildContext context){
    reset(context: context);
    getNearestDestination(context: context);
    notifyListeners();
  }

  setStartDate(String val){
    startDate.text = val;
    notifyListeners();
  }

  setEndDate(String val){
    endDate.text = val;
    notifyListeners();
  }

  init() async {
    scrollController = ScrollController()
      ..addListener(() {});
  }

  scrollToTop(){
    scrollController!.animateTo(scrollController!.position.minScrollExtent, curve: Curves.easeIn, duration: const Duration(milliseconds: 500),);
    notifyListeners();
  }

  selectTempleType(String val) {
    selectedDestinationType = val;
    notifyListeners();
  }

  selectSortColumn(String val) {
    sortColumn = val;
    notifyListeners();
  }

  selectSortDirection(String val) {
    sortDirection = val;
    notifyListeners();
  }

  selectCountry(String val) {
    selectedCountry = val;
    notifyListeners();
  }

  selectState(String val) {
    selectedState = val;
    notifyListeners();
  }

  selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,allowedExtensions: ["jpg","jpeg","png"],type: FileType.custom,);
    if (result != null) {
      selectedImage = result.files.first.path;
      print("IMAGE PATH :");
      print(selectedImage);
      notifyListeners();
    }
  }

  selectImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera,maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50);
    if(image != null){
      selectedImage = image.path;
      print("IMAGE PATH :");
      print(selectedImage);
      notifyListeners();
    }
  }

  selectImage1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,allowedExtensions: ["jpg","jpeg","png"],type: FileType.custom,);
    if (result != null) {
      selectedImage1 = result.files.first.path;
      print("IMAGE 1 PATH :");
      print(selectedImage1);
      notifyListeners();
    }
  }

  selectImageCamera1() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera,maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50);
    if(image != null){
      selectedImage1 = image.path;
      print("IMAGE 1 PATH :");
      print(selectedImage1);
      notifyListeners();
    }
  }

  selectImage2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,allowedExtensions: ["jpg","jpeg","png"],type: FileType.custom,);
    if (result != null) {
      selectedImage2 = result.files.first.path;
      print("IMAGE 2 PATH :");
      print(selectedImage2);
      notifyListeners();
    }
  }

  selectImageCamera2() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera,maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50);
    if(image != null){
      selectedImage2 = image.path;
      print("IMAGE 2 PATH :");
      print(selectedImage2);
      notifyListeners();
    }
  }

  selectImage3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,allowedExtensions: ["jpg","jpeg","png"],type: FileType.custom,);
    if (result != null) {
      selectedImage3 = result.files.first.path;
      print("IMAGE 3 PATH :");
      print(selectedImage3);
      notifyListeners();
    }
  }

  selectImageCamera3() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera,maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50);
    if(image != null){
      selectedImage3 = image.path;
      print("IMAGE 2 PATH :");
      print(selectedImage3);
      notifyListeners();
    }
  }

  selectImage4() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,allowedExtensions: ["jpg","jpeg","png"],type: FileType.custom,);
    if (result != null) {
      selectedImage4 = result.files.first.path;
      print("IMAGE 4 PATH :");
      print(selectedImage4);
      notifyListeners();
    }
  }

  selectImageCamera4() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera,maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50);
    if(image != null){
      selectedImage4 = image.path;
      print("IMAGE 2 PATH :");
      print(selectedImage4);
      notifyListeners();
    }
  }

  removeImage(String val){
    otherImages.remove(val);
    notifyListeners();
  }

  clearImage(){
    selectedImage = null;
    notifyListeners();
  }

  clearImage1(){
    selectedImage1 = null;
    notifyListeners();
  }

  clearImage2(){
    selectedImage2 = null;
    notifyListeners();
  }

  clearImage3(){
    selectedImage3 = null;
    notifyListeners();
  }

  clearImage4(){
    selectedImage4 = null;
    notifyListeners();
  }

  clearTempImage(){
    templeImage = null;
    notifyListeners();
  }

  clearTempImage1(){
    templeImage1 = null;
    notifyListeners();
  }

  clearTempImage2(){
    templeImage2 = null;
    notifyListeners();
  }

  clearTempImage3(){
    templeImage3 = null;
    notifyListeners();
  }

  clearTempImage4(){
    templeImage4 = null;
    notifyListeners();
  }

  Future getDestinationTypes({
    required BuildContext context,
  }) async {
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.getApi(
      url: '${ApiUrls().baseUrl}destinationType',
      header: header,
      context: context,
      isLoading: false,
    );
    // print("TEMPLE TYPES RESPONSE");
    // Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        // print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        return response;
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  Future getCountries({
    required BuildContext context,
  }) async {
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.getApi(
      url: '${ApiUrls().baseUrl}country',
      header: header,
      context: context,
      isLoading: false,
    );
    // print("COUNTRY RESPONSE");
    // Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        // print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        return response;
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  Future getStates({
    required BuildContext context,
  }) async {
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.getApi(
      url: '${ApiUrls().baseUrl}state',
      header: header,
      context: context,
      isLoading: false,
    );
    // print("STATE RESPONSE");
    // Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        // print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        return response;
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  getDestinations({ required BuildContext context,}){
    selectedSort = 0;
    destinationList = null;
    page1 = 0;
    showMoreTempleLoader1 = false;
    isSearching1 = false;
    showMoreTemple1 = false;
    controller1 = ScrollController();
    controller1!.addListener(() {
      if (controller1!.offset >= controller1!.position.maxScrollExtent &&
          !controller1!.position.outOfRange) {
        print("MAXXXXXXXXXXXXXXXX");
        print("CALLING MORE 1");
        if (showMoreTemple1) {
          print("CALLING MORE 2");
          if (showMoreTempleLoader1 == false) {
            print("CALLING MORE 3");
            getMoreJob(context: context);
          }
        }
      }
      if (controller1!.offset <= controller1!.position.minScrollExtent &&
          !controller1!.position.outOfRange) {
        print("MINNNNNNNNNNNNNNNNNN");
      }
    });
    getDestinationsList(context: context);
  }

  getMoreJob({
    required BuildContext context,
  }) async {
    page1++;
    showMoreTempleLoader1 = true;
    notifyListeners();
    getDestinationsList(context: context);
  }

  void getDestinationsList({
    required BuildContext context,
  }) async {
    searchResult = null;
    notifyListeners();
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    final response = await apiService.getApi(
      url:
          '${ApiUrls().baseUrl}destinationList?customerId=$customerId&deviceRegistrationId=$deviceId&limit=10&start=${page1*10}',
      header: header,
      context: context,
      isLoading: false,
    );
    print("DESTINATION LIST RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200 || response["status"] == 204) {

        if (page1 == 0) {
          destinationList = DestinationListResponse(result: []);
        } else {
          print("CALLING FROM PAGINATION");
        }
        destinationList = DestinationListResponse(
          totalRows: response["totalRows"] ?? 0,
          status: response["status"],
          result: destinationList!.result! + DestinationListResponse.fromJson(response).result!,
        );
        showMoreTempleLoader1 = false;
        if (destinationList!.totalRows! <= destinationList!.result!.length) {
          print("SHOW MORE false ");
          showMoreTemple1 = false;
        } else {
          print("SHOW MORE true ");
          showMoreTemple1 = true;
        }
        notifyListeners();
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        // templesList = TemplesList.fromJson(response);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  getNearestDestination({ required BuildContext context,}){
    try{
      nearDestinationList = null;
      page2 = 0;
      selectedSort = 0;
      showMoreTempleLoader2 = false;
      isSearching2 = false;
      showMoreTemple2 = false;
      controller2 = ScrollController();
      controller2!.addListener(() {
        if (controller2!.offset >= controller2!.position.maxScrollExtent &&
            !controller2!.position.outOfRange) {
          print("MAXXXXXXXXXXXXXXXX");
          print("CALLING MORE 1");
          if (showMoreTemple2) {
            print("CALLING MORE 2");
            if (showMoreTempleLoader2 == false) {
              print("CALLING MORE 3");
              getMoreJob2(context: context);
            }
          }
        }
        if (controller2!.offset <= controller2!.position.minScrollExtent &&
            !controller2!.position.outOfRange) {
          print("MINNNNNNNNNNNNNNNNNN");
        }
      });
      getNearestDestinationList(context: context);
    }catch(e){
      print("ERR %%% ");
      print(e.toString());
    }
  }

  getMoreJob2({
    required BuildContext context,
  }) async {
    page2++;
    showMoreTempleLoader2 = true;
    notifyListeners();
    getNearestDestinationList(context: context);
  }

  void getNearestDestinationList({
    required BuildContext context,
  }) async {
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    List<String> location = await UserSharedPref().returnLocation();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    final response = await apiService.getApi(
      url:
          '${ApiUrls().baseUrl}nearbyDestinationList?customerId=$customerId&deviceRegistrationId=$deviceId&latitude=${location[0]}&longitude=${location[1]}&limit=10&start=${page2*10}',
          // '${ApiUrls().baseUrl}nearbyTempleList?customerId=$customerId&deviceRegistrationId=$deviceId&latitude=${9.9312}&longitude=${76.2673}',
      header: header,
      context: context,
      isLoading: false,
    );
    print("NEAR DESTINATION LIST RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200 || response["status"] == 204) {
        if (page2 == 0) {
          nearDestinationList = DestinationListResponse(result: []);
        } else {
          print("CALLING FROM PAGINATION");
        }
        nearDestinationList = DestinationListResponse(
          totalRows: response["totalRows"] ?? 0,
          status: response["status"],
          result: nearDestinationList!.result! + DestinationListResponse.fromJson(response).result!,
        );
        showMoreTempleLoader2 = false;
        if (nearDestinationList!.totalRows! <= nearDestinationList!.result!.length) {

          showMoreTemple2 = false;
        } else {

          showMoreTemple2 = true;
        }
        notifyListeners();// nearTemplesList = TemplesList.fromJson(response);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);}
    }
    notifyListeners();
  }

  void getDestinationDetail({
    required BuildContext context,
    required String destinationId,
  }) async {
    destinationDetail = null;
    destinationImages = [];
    destinationImagesLength = 0;
    notifyListeners();
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    final response = await apiService.getApi(
      url:
          '${ApiUrls().baseUrl}retriveDestinationById?customerId=$customerId&deviceRegistrationId=$deviceId&destinationId=$destinationId',
      header: header,
      context: context,
      isLoading: false,
    );
    print("DESTINATION DETAIL RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        destinationDetail = DestinationDetailResponse.fromJson(response);
        if (destinationDetail!.result!.destinationPhoto!.isNotEmpty) {
          destinationImagesLength++;
          destinationImages.add(destinationDetail!.result!.destinationPhoto!);
        }
        if (destinationDetail!.result!.destinationImageUrl1!.isNotEmpty) {
          destinationImagesLength++;
          destinationImages.add(destinationDetail!.result!.destinationImageUrl1!);
        }
        if (destinationDetail!.result!.destinationImageUrl2!.isNotEmpty) {
          destinationImagesLength++;
          destinationImages.add(destinationDetail!.result!.destinationImageUrl2!);
        }
        if (destinationDetail!.result!.destinationImageUrl3!.isNotEmpty) {
          destinationImagesLength++;
          destinationImages.add(destinationDetail!.result!.destinationImageUrl3!);
        }
        if (destinationDetail!.result!.destinationImageUrl4!.isNotEmpty) {
          destinationImagesLength++;
          destinationImages.add(destinationDetail!.result!.destinationImageUrl4!);
        }
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void deleteDestination({
    required BuildContext context,
    required String destId,
  }) async {
    CommonWidgets().showLoaderAlert(context: context);
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    final response = await apiService.deleteApi(
      url:
          '${ApiUrls().baseUrl}deleteDestination?customerId=$customerId&deviceRegistrationId=$deviceId&destinationId=$destId',
      header: header,
      context: context,
      isLoading: false,
    );
    Navigator.pop(context);
    print("DESTINATION DELETE RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        CommonWidgets()
            .showSnack(context: context, msg: "Deleted Destination Successfully");
        getDestinations(context: context);
        Navigator.pop(context);
        Navigator.pop(context);
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void addDestination({
    required BuildContext context,
  }) async {
    CommonWidgets().showLoaderAlert(context: context);
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    List<String> location = await UserSharedPref().returnLocation();
    Uri uri = Uri.parse("${ApiUrls().baseUrl}saveDestinationFull");
    Map<String, String> headers = {
      "Accept": "application/json",
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    MultipartRequest request = http.MultipartRequest('POST', uri);
    request.files.add(
      http.MultipartFile('destinationPhoto', File(selectedImage!).readAsBytes().asStream(),
          File(selectedImage!).lengthSync(),
          filename: selectedImage!.split("/").last,
          contentType:
          MediaType("image", selectedImage!.split("/").last.split(".").last)),
    );
    if(selectedImage1 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL1', File(selectedImage1!).readAsBytes().asStream(),
            File(selectedImage1!).lengthSync(),
            filename: selectedImage1!.split("/").last,
            contentType:
            MediaType("image", selectedImage1!.split("/").last.split(".").last)),
      );
    }
    if(selectedImage2 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL2', File(selectedImage2!).readAsBytes().asStream(),
            File(selectedImage2!).lengthSync(),
            filename: selectedImage2!.split("/").last,
            contentType:
            MediaType("image", selectedImage2!.split("/").last.split(".").last)),
      );
    }
    if(selectedImage3 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL3', File(selectedImage3!).readAsBytes().asStream(),
            File(selectedImage3!).lengthSync(),
            filename: selectedImage3!.split("/").last,
            contentType:
            MediaType("image", selectedImage3!.split("/").last.split(".").last)),
      );
    }
    if(selectedImage4 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL4', File(selectedImage4!).readAsBytes().asStream(),
            File(selectedImage4!).lengthSync(),
            filename: selectedImage4!.split("/").last,
            contentType:
            MediaType("image", selectedImage4!.split("/").last.split(".").last)),
      );
    }
    request.fields["customerId"] = customerId!;
    request.fields["deviceRegistrationId"] = deviceId;
    request.fields["destinationTypeNames"] = selectedDestinationType!;
    request.fields["destinationName"] = templeName.text;
    request.fields["localName"] = templeLocalName.text;
    request.fields["cityName"] = templeCity.text;
    request.fields["provinceName"] = selectedState!;
    request.fields["countryName"] = selectedCountry!;
    request.fields["postalCode"] = zipCode.text;
    request.fields["destinationPhotoCourtesy"] = imageCourtesy.text;
    request.fields["destinationDescription"] = templeDescription.text;
    request.fields["bestSeason"] = bestSeason.text;
    request.fields["destinationAttractions"] = destAttraction.text;
    request.fields["latitude"] = location[0];
    request.fields["longitude"] = location[1];
    request.headers.addAll(headers);
    final response = await apiService.postMultiPartFormDataApi(
      request: request, context: context, isLoading: true,
    );
    Navigator.pop(context);
    print("ADD DESTINATION RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        CommonWidgets()
            .showSnack(context: context, msg: "Added Destination Successfully");
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        Navigator.pop(context);
        getDestinations(context: context);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  Future uploadDest(DestinationLD element,BuildContext context,) async{
    Uri uri = Uri.parse("${ApiUrls().baseUrl}saveDestinationFull");
    String? token = await UserSharedPref().getToken();
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    Map<String, String> headers = {
      "Accept": "application/json",
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    MultipartRequest request = http.MultipartRequest('POST', uri);
    request.files.add(
      http.MultipartFile('destinationPhoto', File(element.destinationPhoto!).readAsBytes().asStream(),
          File(element.destinationPhoto!).lengthSync(),
          filename: element.destinationPhoto!.split("/").last,
          contentType:
          MediaType("image", element.destinationPhoto!.split("/").last.split(".").last)),
    );
    if(element.destinationImageURL1 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL1', File(element.destinationImageURL1!).readAsBytes().asStream(),
            File(element.destinationImageURL1!).lengthSync(),
            filename: element.destinationImageURL1!.split("/").last,
            contentType:
            MediaType("image", element.destinationImageURL1!.split("/").last.split(".").last)),
      );
    }
    if(element.destinationImageURL2 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL2', File(element.destinationImageURL2!).readAsBytes().asStream(),
            File(element.destinationImageURL2!).lengthSync(),
            filename: element.destinationImageURL2!.split("/").last,
            contentType:
            MediaType("image", element.destinationImageURL2!.split("/").last.split(".").last)),
      );
    }
    if(element.destinationImageURL3 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL3', File(element.destinationImageURL3!).readAsBytes().asStream(),
            File(element.destinationImageURL3!).lengthSync(),
            filename: element.destinationImageURL3!.split("/").last,
            contentType:
            MediaType("image", element.destinationImageURL3!.split("/").last.split(".").last)),
      );
    }
    if(element.destinationImageURL4 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL4', File(element.destinationImageURL4!).readAsBytes().asStream(),
            File(element.destinationImageURL4!).lengthSync(),
            filename: element.destinationImageURL4!.split("/").last,
            contentType:
            MediaType("image", element.destinationImageURL4!.split("/").last.split(".").last)),
      );
    }
    request.fields["customerId"] = customerId!;
    request.fields["destinationLocalId"] = element.localId!;
    request.fields["deviceRegistrationId"] = deviceId;
    request.fields["destinationTypeNames"] = element.destinationTypeNames!;
    request.fields["destinationName"] = element.destinationName!;
    request.fields["localName"] = element.localName!;
    request.fields["cityName"] = element.cityName!;
    request.fields["provinceName"] = element.provinceName!;
    request.fields["countryName"] = element.countryName!;
    request.fields["postalCode"] = element.postalCode!;
    request.fields["destinationPhotoCourtesy"] = element.destinationPhotoCourtesy!;
    request.fields["destinationDescription"] = element.destinationDescription!;
    request.fields["bestSeason"] = element.bestSeason!;
    request.fields["destinationAttractions"] = element.destinationAttractions!;
    request.fields["latitude"] = element.latitude!;
    request.fields["longitude"] = element.longitude!;
    request.headers.addAll(headers);
    final response = await apiService.postMultiPartFormDataApi(
      request: request, context: context, isLoading: true,
    );
    return response;
  }

  void uploadLocalTemple({
    required BuildContext context,
  }) async {
    var dbPro = Provider.of<LocalDataBaseProvider>(context,listen: false);
    for (var element in localDestination) {
      print("NOW LIST IS : ${localDestination.length}");
      var response = await uploadDest(element,context);
    print("LOCAL DESTINATION UPLOAD RESPONSE");
    Logger().d(response);
    if (response["status"] == 200) {
      print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@ ${element.destinationName}");
      await dbPro.deleteDataFromDataBaseWith("DELETE FROM Destinations WHERE localId = ?",
          [element.localId]);
      notifyListeners();
    }else{
      CommonWidgets().showSnack(msg: response["message"], context: context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LocalDestinations()));
    }}
    print("AFTER ADDED LOCAL STORED DESTINATIONS");
    checkLocalDestinations(context);
    print("AFTER ADDED LOCAL STORED DESTINATIONS 3333");
  }

  addLocalDestination({required BuildContext context}) async {
    CommonWidgets().showLoaderAlert(context: context);
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    List<String> location = await UserSharedPref().returnLocation();
    var data = {
      "destinationId" : "",
      "localId" : DateTime.now().microsecondsSinceEpoch.toString(),
      "destinationPhoto" : selectedImage,
      "destinationImageURL1" : selectedImage1,
      "destinationImageURL2" : selectedImage2,
      "destinationImageURL3" : selectedImage3,
      "destinationImageURL4" : selectedImage4,
      "customerId" : customerId,
      "deviceRegistrationId" : deviceId,
      "destinationTypeNames" : selectedDestinationType,
      "destinationName" : templeName.text,
      "localName": templeLocalName.text,
      "cityName": templeCity.text,
      "provinceName": selectedState,
      "countryName": selectedCountry!,
      "postalCode": zipCode.text,
      "destinationPhotoCourtesy": imageCourtesy.text,
      "destinationDescription": templeDescription.text,
      "bestSeason": bestSeason.text,
      "destinationAttractions": destAttraction.text,
      "latitude": location[0],
      "longitude": location[1],
      "createdDate": DateTime.now().toString(),
    };
    List<Map<String, dynamic>> rawTemple = [];
    rawTemple.add(
      data
    );
    print("ADD DESTINATION LOCALLY");
    Logger().d(rawTemple);
    await Provider.of<LocalDataBaseProvider>(context,listen: false).bulkInsert(rawTemple, "Destinations");
    Provider.of<TempleProvider>(context,listen: false).getLocalDestinations(context);
    Navigator.pop(context);
    Navigator.pop(context);
    reset(context: context);
    CommonWidgets().showSnack(msg: "Destination added on local device!", context: context);
  }

  editLocalDestination({required BuildContext context}) async {
    CommonWidgets().showLoaderAlert(context: context);
    String? customerId = await UserSharedPref().getCustomerId();
    List<String> location = await UserSharedPref().returnLocation();
    await Provider.of<LocalDataBaseProvider>(context,listen: false).updateDataToDataBase("UPDATE Destination SET "
        "destinationPhoto = ?, "
        "destinationImageURL1 = ?,"
        "destinationImageURL2 = ?,"
        "destinationImageURL3 = ?,"
        "destinationImageURL4 = ?,"
        "destinationTypeNames = ?,"
        "destinationName = ?,"
        "localName = ?,"
        "cityName = ?,"
        "provinceName = ?,"
        "countryName = ?,"
        "postalCode = ?,"
        "destinationPhotoCourtesy = ?,"
        "destinationDescription = ?,"
        "bestSeason = ?,"
        "destinationAttractions = ?,"
        "latitude = ?,"
        "longitude = ?"
        " WHERE localId = ?",
    [selectedImage,selectedImage1,selectedImage2,selectedImage3,selectedImage4,selectedDestinationType,templeName.text,templeLocalName.text,
      templeCity.text,selectedState,selectedCountry!,zipCode.text,imageCourtesy.text,templeDescription.text,
      bestSeason.text,destAttraction.text,location[0],
      location[1],localId]);
    Provider.of<TempleProvider>(context,listen: false).getLocalDestinations(context);
    Navigator.pop(context);
    Navigator.pop(context);
    CommonWidgets().showSnack(msg: "Destination edited!", context: context);
  }

  deleteLocalDestination({required BuildContext context,required String localId}) async {
    CommonWidgets().showLoaderAlert(context: context);
    String? customerId = await UserSharedPref().getCustomerId();
    await Provider.of<LocalDataBaseProvider>(context,listen: false).deleteDataFromDataBaseWith("DELETE FROM Destinations WHERE localId = ?",
    [localId]);
    Provider.of<TempleProvider>(context,listen: false).getLocalDestinations(context);
    Navigator.pop(context);
    Navigator.pop(context);
    CommonWidgets().showSnack(msg: "Destination deleted!", context: context);
  }

  checkLocalDestinations(BuildContext context) async {
    localDestination2 = await getLocalDestinations(context);
    print("GETTING LOCAL DESTINATIONS : ");
    Logger().d(localDestination2!.toList());
    if(localDestination2 != null && localDestination2!.isNotEmpty){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const OfflineUploadDashBoard()), (route) => false);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const OfflineUploadDashBoard()), (route) => false);
    }else{
      PageNavigation().gotoDashboard(context);
    }
  }

  reset({required BuildContext context}){
    selectedSort = 0;
   sortColumn = null;
    sortDirection = null;
    editDest = false;
    templeId = null;
    selectedDestinationType = null;
    templeName.text = "";
    templeLocalName.text = "";
    templeLocation.text = "";
    templeCity.text = "";
    selectedState = null;
    selectedCountry = null;
    zipCode.text = "";
    selectedImage = null;
    selectedImage1 = null;
    selectedImage2 = null;
    selectedImage3 = null;
    selectedImage4 = null;
    imageCourtesy.text = "";
    templeImage = null;
    templeImage1 = null;
    templeImage2 = null;
    templeImage3 = null;
    templeImage4 = null;
    templeDescription.text = "";
    bestSeason.text = "";
    destAttraction.text = "";
    notifyListeners();
    // getStates(context: context);
    // getCountries(context: context);
    // getTempleTypes(context: context);
  }

  edit({required DestinationDetail data,required BuildContext context}){
    editDest = true;
    templeId = data.destinationId;
    selectedDestinationType = data.destinationTypeNames;
    templeName.text = data.destinationName!;
    templeLocalName.text = data.localName!;
    templeCity.text = data.cityName!;
    selectedState = data.provinceName;
    selectedCountry = data.countryName;
    zipCode.text = data.postalCode!;
    templeImage = data.destinationPhoto;
    templeImage1 = data.destinationImageUrl1;
    templeImage2 = data.destinationImageUrl2;
    templeImage3 = data.destinationImageUrl3;
    templeImage4 = data.destinationImageUrl4;
    imageCourtesy.text = data.destinationPhotoCourtesy!;
    templeDescription.text = data.destinationDescription!;
    bestSeason.text = data.bestSeason!;
    destAttraction.text = data.destinationAttractions!;
    notifyListeners();
    // getStates(context: context);
    // getCountries(context: context);
    // getTempleTypes(context: context);
  }

  String localId = "";
  editLocal({required DestinationLD data,required BuildContext context}){
    editDest = true;
    templeId = data.destinationId;
    localId = data.localId!;
    selectedDestinationType = data.destinationTypeNames;
    templeName.text = data.destinationName!;
    templeLocalName.text = data.localName!;
    templeCity.text = data.cityName!;
    selectedState = data.provinceName;
    selectedCountry = data.countryName;
    zipCode.text = data.postalCode!;
    selectedImage = data.destinationPhoto;
    selectedImage1 = data.destinationImageURL1;
    selectedImage2 = data.destinationImageURL2;
    selectedImage3 = data.destinationImageURL3;
    selectedImage4 = data.destinationImageURL4;
    imageCourtesy.text = data.destinationPhotoCourtesy!;
    templeDescription.text = data.destinationDescription!;
    bestSeason.text = data.bestSeason!;
    destAttraction.text = data.destinationAttractions!;
    notifyListeners();
    // getStates(context: context);
    // getCountries(context: context);
    // getTempleTypes(context: context);
  }

  void editDestination({
    required BuildContext context,
  }) async {
    CommonWidgets().showLoaderAlert(context: context);
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    List<String> location = await UserSharedPref().returnLocation();
    Uri uri = Uri.parse("${ApiUrls().baseUrl}saveDestinationFull");
    Map<String, String> headers = {
      "Accept": "application/json",
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    MultipartRequest request = http.MultipartRequest('POST', uri);
    if(selectedImage != null){
      request.files.add(
        http.MultipartFile(
            'destinationPhoto',
            File(selectedImage!).readAsBytes().asStream(),
            File(selectedImage!).lengthSync(),
            filename: selectedImage!.split("/").last,
            contentType: MediaType(
                "image", selectedImage!.split("/").last.split(".").last)),
      );
    }
    if(selectedImage1 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL1', File(selectedImage1!).readAsBytes().asStream(),
            File(selectedImage1!).lengthSync(),
            filename: selectedImage1!.split("/").last,
            contentType:
            MediaType("image", selectedImage1!.split("/").last.split(".").last)),
      );
    } if(selectedImage2 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL2', File(selectedImage2!).readAsBytes().asStream(),
            File(selectedImage2!).lengthSync(),
            filename: selectedImage2!.split("/").last,
            contentType:
            MediaType("image", selectedImage2!.split("/").last.split(".").last)),
      );
    } if(selectedImage3 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL3', File(selectedImage3!).readAsBytes().asStream(),
            File(selectedImage3!).lengthSync(),
            filename: selectedImage3!.split("/").last,
            contentType:
            MediaType("image", selectedImage3!.split("/").last.split(".").last)),
      );
    } if(selectedImage4 != null){
      request.files.add(
        http.MultipartFile('destinationImageURL4', File(selectedImage4!).readAsBytes().asStream(),
            File(selectedImage4!).lengthSync(),
            filename: selectedImage4!.split("/").last,
            contentType:
            MediaType("image", selectedImage4!.split("/").last.split(".").last)),
      );
    }
    // //templeId:8
    request.fields["customerId"] = customerId!;
    request.fields["destinationId"] = templeId!;
    request.fields["deviceRegistrationId"] = deviceId;
    request.fields["destinationTypeNames"] = selectedDestinationType!;
    request.fields["destinationName"] = templeName.text;
    request.fields["localName"] = templeLocalName.text;
    request.fields["cityName"] = templeCity.text;
    request.fields["provinceName"] = selectedState!;
    request.fields["countryName"] = selectedCountry!;
    request.fields["postalCode"] = zipCode.text;
    request.fields["destinationPhotoCourtesy"] = imageCourtesy.text;
    request.fields["destinationDescription"] = templeDescription.text;
    request.fields["bestSeason"] = bestSeason.text;
    request.fields["destinationAttractions"] = destAttraction.text;
    request.fields["latitude"] = location[0];
    request.fields["longitude"] = location[1];
    request.headers.addAll(headers);
    final response = await apiService.postMultiPartFormDataApi(
      request: request, context: context, isLoading: true,
    );
    Navigator.pop(context);
    print("EDIT DESTINATION RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        CommonWidgets()
            .showSnack(context: context, msg: "Edit Destination Successful");
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        Navigator.pop(context);
        Navigator.pop(context);
        getDestinations(context: context);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  getDestinationsSearch({ required BuildContext context,}){
    try{
      destinationList = null;
      page1 = 0;
      showMoreTempleLoader1 = false;
      isSearching1 = false;
      showMoreTemple1 = false;
      controller1 = ScrollController();
      notifyListeners();
      controller1!.addListener(() {
        if (controller1!.offset >= controller1!.position.maxScrollExtent &&
            !controller1!.position.outOfRange) {
          print("MAXXXXXXXXXXXXXXXX");
          print("CALLING MORE 1");
          if (showMoreTemple1) {
            print("CALLING MORE 2");
            if (showMoreTempleLoader1 == false) {
              print("CALLING MORE 3");
              getMoreJob4(context: context);
            }
          }
        }
        if (controller1!.offset <= controller1!.position.minScrollExtent &&
            !controller1!.position.outOfRange) {
          print("MINNNNNNNNNNNNNNNNNN");
        }
      });
      getDestinationsListSearch(context: context);
      notifyListeners();
    }catch(e){
      print("ERR %%% ");
      print(e.toString());
    }
  }

  getMoreJob4({
    required BuildContext context,
  }) async {
    page1++;
    showMoreTempleLoader1 = true;
    notifyListeners();
    getDestinationsListSearch(context: context);
  }

  void getDestinationsListSearch({
    required BuildContext context,
  }) async {
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    // List<String> location = await UserSharedPref().returnLocation();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    String url = '${ApiUrls().baseUrl}destinationList?customerId=$customerId&deviceRe'
        'gistrationId=$deviceId&limit=10&start=${page1*10}';
    if(templeName.text.isNotEmpty){
      url = "$url&destinationName=${templeName.text}";
    }
    if(sortColumn != null && sortDirection != null){
      url = "$url&sortColumn=$sortColumn&sortDirection=$sortDirection";
    }
    final response = await apiService.getApi(
      url: url,
      header: header,
      context: context,
      isLoading: false,
    );
    print("SEARCH DESTINATION LIST RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200 || response["status"] == 204) {
        if (page1 == 0) {
          destinationList = DestinationListResponse(result: []);
        } else {
          print("CALLING FROM PAGINATION");
        }
        destinationList = DestinationListResponse(
          totalRows: response["totalRows"] ?? 0,
          status: response["status"],
          result: destinationList!.result! + DestinationListResponse.fromJson(response).result!,
        );
        showMoreTempleLoader1 = false;
        if (destinationList!.totalRows! <= destinationList!.result!.length) {
          print("SHOW MORE false ");
          showMoreTemple1 = false;
        } else {
          print("SHOW MORE true ");
          showMoreTemple1 = true;
        }
        notifyListeners();
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        // nearTemplesList = TemplesList.fromJson(response);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  getNearestDestinationsSearch({ required BuildContext context,}){
    try{
      nearDestinationList = null;
      page2 = 0;
      showMoreTempleLoader2 = false;
      isSearching2 = false;
      showMoreTemple2 = false;
      controller2 = ScrollController();
      notifyListeners();
      controller2!.addListener(() {
        if (controller2!.offset >= controller2!.position.maxScrollExtent &&
            !controller2!.position.outOfRange) {
          print("MAXXXXXXXXXXXXXXXX");
          print("CALLING MORE 1");
          if (showMoreTemple2) {
            print("CALLING MORE 2");
            if (showMoreTempleLoader2 == false) {
              print("CALLING MORE 3");
              getMoreJob3(context: context);
            }
          }
        }
        if (controller2!.offset <= controller2!.position.minScrollExtent &&
            !controller2!.position.outOfRange) {
          print("MINNNNNNNNNNNNNNNNNN");
        }
      });
      getNearestDestinationsListSearch(context: context);
      notifyListeners();
    }catch(e){
      print("ERR %%% ");
      print(e.toString());
    }
  }

  getMoreJob3({
    required BuildContext context,
  }) async {
    page2++;
    showMoreTempleLoader2 = true;
    notifyListeners();
    getNearestDestinationsListSearch(context: context);
  }

  void getNearestDestinationsListSearch({
    required BuildContext context,
  }) async {
    String deviceId = await UserSharedPref().getDeviceId();
    String? customerId = await UserSharedPref().getCustomerId();
    String? token = await UserSharedPref().getToken();
    List<String> location = await UserSharedPref().returnLocation();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
      "Authorization": token!,
    };
    String url = '${ApiUrls().baseUrl}nearbyDestinationList?customerId=$customerId&latitude=${location[0]}&longitude=${location[1]}&deviceRe'
        'gistrationId=$deviceId&limit=10&start=${page2*10}';
    if(templeName.text.isNotEmpty){
      url = "$url&destinationName=${templeName.text}";
    }
    if(sortColumn != null && sortDirection != null){
      url = "$url&sortColumn=$sortColumn&sortDirection=$sortDirection";
    }
    final response = await apiService.getApi(
      url: url,
      header: header,
      context: context,
      isLoading: false,
    );
    print("SEARCH NEAR DESTINATION LIST RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200 || response["status"] == 204) {
        if (page2 == 0) {
          nearDestinationList = DestinationListResponse(result: []);
        } else {
          print("CALLING FROM PAGINATION");
        }
        nearDestinationList = DestinationListResponse(
          totalRows: response["totalRows"] ?? 0,
          status: response["status"],
          result: nearDestinationList!.result! + DestinationListResponse.fromJson(response).result!,
        );
        showMoreTempleLoader2 = false;
        if (nearDestinationList!.totalRows! <= nearDestinationList!.result!.length) {
          print("SHOW MORE false ");
          showMoreTemple2 = false;
        } else {
          print("SHOW MORE true ");
          showMoreTemple2 = true;
        }
        notifyListeners();
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        // nearTemplesList = TemplesList.fromJson(response);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  Future getList(BuildContext context) async {
    List<Map> st = await Provider.of<LocalDataBaseProvider>(context, listen: false)
        .getDataFromTableWithoutCondition(
        'SELECT * FROM States');
    List<Map> ct = await Provider.of<LocalDataBaseProvider>(context, listen: false)
        .getDataFromTableWithoutCondition(
        'SELECT * FROM Countries');
    List<Map> tt = await Provider.of<LocalDataBaseProvider>(context, listen: false)
        .getDataFromTableWithoutCondition(
        'SELECT * FROM DestinationTypes');
    countriesList = [];
    statesList = [];
    typesList = [];
    for (var element in ct) {
      List value = element.values.toList();
      countriesList.add(Country(
        countryId: value[1],
        countryName: value[2],
        countryCode: value[3],
      ));
    }
    for (var element in st) {
      List value = element.values.toList();
      statesList.add(States(
        stateId: value[1].toString(),
        countryId: value[2].toString(),
        stateName: value[3].toString(),
        status : value[4].toString(),
      ));
    }
    for (var element in tt) {
      List value = element.values.toList();
      typesList.add(DestinationTypeData(
          destinationTypeId : value[1].toString(),
        destinationType : value[2].toString(),
        parentDestinationTypeId : value[3].toString(),
        isRouteType : value[4].toString(),
        status : value[5].toString(),
      ));
    }
    print("Types list ${typesList.length}");
    notifyListeners();
    return true;
  }

  Future getLocalDestinations(BuildContext context) async{
    String? cusId = await UserSharedPref().getCustomerId();
    List<Map> temples = await Provider.of<LocalDataBaseProvider>(context, listen: false)
        .getDataFromTable(
        'SELECT * FROM Destinations WHERE customerId=?',[cusId]);
    print("LOCAL TEMPLES ${temples.toList().length}");
    Logger().d(temples.toList());
    if(temples.length > 0){
      localDestination = [];
      for (var element in temples) {
        List value = element.values.toList();
        var data = DestinationLD(
            destinationId : value[0] ?? "",
            localId : value[1],
          destinationPhoto : value[2],
          destinationImageURL1: value[3],
          destinationImageURL2 : value[4],
          destinationImageURL3 : value[5],
          destinationImageURL4 : value[6],
          customerId : value[7],
          deviceRegistrationId : value[8],
          destinationTypeNames : value[9],
          destinationName : value[10],
          localName: value[11],
          cityName: value[12],
          provinceName: value[13],
          countryName: value[14],
          postalCode: value[15],
          destinationPhotoCourtesy: value[16],
          destinationDescription: value[17],
          bestSeason: value[18],
          destinationAttractions: value[19],
          latitude: value[20],
          longitude: value[21],
          createdDate: value[22],
        );
        localDestination.add(data);
      }
    }else{
      localDestination = [];
    }
    notifyListeners();
    return localDestination;
  }
}
