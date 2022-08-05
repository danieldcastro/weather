import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/core/util/Helpers/set_weather_details.dart';
import 'package:weather/presentation/pages/home/controllers/home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller
        .getWeatherByCityName(
          cityName: 'São Paulo',
          context: context,
        )
        .whenComplete(() => setState(() {
              _controller.isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SetWeatherDetails.setBackColorByHour(
          _controller.weather?.time ?? DateTime.now()),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _controller.weather?.cityName ?? '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _controller.weather?.temp.toString() ?? '',
                            style: const TextStyle(
                                height: 1,
                                fontSize: 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _controller.weather == null ? '' : '°',
                            style: const TextStyle(
                                height: 1.1,
                                fontSize: 80,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(_controller.weather == null ? '' : 'c',
                              style: const TextStyle(
                                  height: 0.9,
                                  fontSize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(_controller.weather?.description ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 350,
            left: MediaQuery.of(context).size.width / 5,
            child: _controller.weather == null
                ? const Offstage()
                : Image.asset(
                    SetWeatherDetails.setImageByConditionCode(
                      _controller.weather?.conditionCode ?? '0',
                    ),
                    height: 250,
                  ),
          ),
          Visibility(
            visible: _controller.isLoading ||
                MediaQuery.of(context).viewInsets.bottom > 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.black54,
                child: Visibility(
                  visible: _controller.isLoading,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                  )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                      validator: ((value) =>
                          value == '' ? 'Não se esqueça da cidade' : null),
                      cursorColor: SetWeatherDetails.setBackColorByHour(
                          _controller.weather?.time ?? DateTime.now()),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                        FilteringTextInputFormatter.allow(
                            RegExp("[A-Za-zÀ-ÿ ]"))
                      ],
                      keyboardType: TextInputType.text,
                      keyboardAppearance: Brightness.dark,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Procure uma cidade',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onFieldSubmitted: (text) async {
                        var weather = await _controller.getWeatherByCityName(
                            cityName: text, context: context);
                        setState(() {
                          weather;
                          _controller.isLoading = false;
                        });
                      }),
                )),
          )
        ],
      ),
    );
  }
}
