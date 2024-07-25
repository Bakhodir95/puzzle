import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dars_64_home/bloc/stones_event.dart';
import 'package:dars_64_home/bloc/stones_state.dart';

class StonesBloc extends Bloc<StonesEvent, StonesState> {
  StonesBloc() : super(InitialStonesState()) {
    on<GetStonesEvent>(_getAllStones);
    on<CheckStoneStonesEvent>(_checkStone);
    on<RandomStonesEvent>(_randomStones);
    on<InitialStonesEvent>(_initialState);
  }

  Map<String, int> _mp = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "10": 10,
    "11": 11,
    "12": 12,
    "13": 13,
    "14": 14,
    "15": 0,
    "16": 15,
  };

  Map<String, int> _finished = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "10": 10,
    "11": 11,
    "12": 12,
    "13": 13,
    "14": 14,
    "15": 15,
    "16": 0,
  };

  void _initialState(InitialStonesEvent event,emit){
    emit(InitialStonesState());
  }

  void _randomStones(RandomStonesEvent event,emit){
    List<int> _numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0];
    _numbers.shuffle(Random());
    for(int i = 0;i < 16;i++){
      _mp['${i + 1}'] = _numbers[i];
    }

    emit(LoadedStonesState(_mp,_finished));
  }

  void _checkStone(CheckStoneStonesEvent event, emit) {
    if (event.stoneNumber == 16){
      if(_mp["${15}"] == 0){
        _mp["${15}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;
      }else if(_mp['12'] == 0){
        _mp["${12}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;

      }
    }else if(event.stoneNumber == 13){
      if(_mp["${14}"] == 0){
        _mp["${14}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;
      }else if(_mp['9'] == 0){
        _mp["${9}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;

      }
    }else if(event.stoneNumber == 1){
      if(_mp["${2}"] == 0){
        _mp["${2}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;
      }else if(_mp['5'] == 0){
        _mp["${5}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;
      }
    }else if(event.stoneNumber == 4){
      if(_mp["${3}"] == 0){
        _mp["${3}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;
      }else if(_mp['8'] == 0){
        _mp["${8}"] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;

      }
    }

    if(event.stoneNumber > 1 && event.stoneNumber < 4){
      if(_mp['${event.stoneNumber - 1}'] == 0 || _mp['${event.stoneNumber + 1}'] == 0){
        _mp["${event.stoneNumber - 1}"] == 0 ? _mp['${event.stoneNumber - 1}'] = event.stoneValue : _mp['${event.stoneNumber + 1}'] = event.stoneValue;
        _mp["${event.stoneNumber}"] = 0;
      }else if(_mp['${event.stoneNumber + 4}'] == 0){
        _mp["${event.stoneNumber + 4}"] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }
    }

    if(event.stoneNumber > 13 && event.stoneNumber < 16){
      if(event.stoneNumber > 1 && event.stoneNumber <= 3){
        if(_mp['${event.stoneNumber - 1}'] == 0 || _mp['${event.stoneNumber + 1}'] == 0){
          _mp["${_mp[event.stoneNumber - 1] == 0 ? event.stoneNumber - 1 : event.stoneNumber + 1}"] = event.stoneValue;
          _mp["${_mp[event.stoneNumber]}"] = 0;
        }else if(_mp['${event.stoneNumber - 4}'] == 0){
          _mp["${event.stoneNumber - 4}"] = event.stoneValue;
          _mp['${event.stoneNumber}'] = 0;
        }
      }
    }

    if(event.stoneNumber == 5 || event.stoneNumber == 8 || event.stoneNumber == 9 || event.stoneNumber == 12){
      if(_mp['${event.stoneNumber - 4}'] == 0){
        _mp['${event.stoneNumber - 4}'] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }else if(_mp['${event.stoneNumber + 4}'] == 0){
        _mp['${event.stoneNumber + 4}'] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }

      if(event.stoneNumber == 5 || event.stoneNumber == 9){
        if(_mp['${event.stoneNumber + 1}'] == 0){
          _mp['${event.stoneNumber + 1}'] = event.stoneValue;
          _mp['${event.stoneNumber}'] = 0;
        }
      }else if(event.stoneNumber == 8 || event.stoneNumber == 12){
        if(_mp['${event.stoneNumber - 1}'] == 0){
          _mp['${event.stoneNumber - 1}'] = event.stoneValue;
          _mp['${event.stoneNumber}'] = 0;
        }
      }
    }else{
      if(_mp['${event.stoneNumber - 1}'] == 0){
        _mp['${event.stoneNumber - 1}'] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }else if(_mp['${event.stoneNumber + 1}'] == 0){
        _mp['${event.stoneNumber + 1}'] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }else if(_mp['${event.stoneNumber - 4}'] == 0){
        _mp['${event.stoneNumber - 4}'] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }else if(_mp['${event.stoneNumber + 4}'] == 0){
        _mp['${event.stoneNumber + 4}'] = event.stoneValue;
        _mp['${event.stoneNumber}'] = 0;
      }
    }

    emit(LoadedStonesState(_mp,_finished));

  }

  void _getAllStones(GetStonesEvent event, emit) {
    emit(LoadingStonesState());
    emit(LoadedStonesState(_mp,_finished));
  }
}
