import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fomoplay/model/subordinate_data_model.dart';
import 'package:fomoplay/repo/subordinate_data_repo.dart';
import 'package:fomoplay/utils/utils.dart';
import 'package:fomoplay/view_modal/user_view_modal.dart';

class SubordinateDataViewModel with ChangeNotifier {
  final _subordinateDataRepo = SubordinateDataRepository();

  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  int _selectedTier = 0;
  int get selectedTier => _selectedTier;
  setTier(int value) {
    _selectedTier = value;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  setDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  SubordinateDataModel? _subordinateData;

  SubordinateDataModel? get subordinateData => _subordinateData;

  setListData(SubordinateDataModel value) {
    _subordinateData = value;
    notifyListeners();
  }

  Future<void> subordinateTierApi(context, dynamic tierId,int status,
      {String date = "", String search = ""}) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "id": userId,
      "tier": tierId,
      "created_at": date,
      "u_id": search
    };
    _subordinateDataRepo.subordinateDataApi(data).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setListData(value);
        if(status==1){
          Navigator.pop(context);
        }
      } else {
        setLoading(false);
        Utils.flushBarSuccessMessage(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
