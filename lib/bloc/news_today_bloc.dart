import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_today_event.dart';
part 'news_today_state.dart';

class NewsTodayBloc extends Bloc<NewsTodayEvent, NewsTodayState> {
  NewsTodayBloc() : super(NewsTodayInitial()) {
    on<NewsTodayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
