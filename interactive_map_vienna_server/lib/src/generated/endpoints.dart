/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/recipe_endpoint.dart' as _i2;
import '../endpoints/toilet_endpoint.dart' as _i3;
import '../endpoints/water_station_endpoint.dart' as _i4;
import '../greeting_endpoint.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'recipe': _i2.RecipeEndpoint()
        ..initialize(
          server,
          'recipe',
          null,
        ),
      'toilet': _i3.ToiletEndpoint()
        ..initialize(
          server,
          'toilet',
          null,
        ),
      'waterStation': _i4.WaterStationEndpoint()
        ..initialize(
          server,
          'waterStation',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['recipe'] = _i1.EndpointConnector(
      name: 'recipe',
      endpoint: endpoints['recipe']!,
      methodConnectors: {
        'generateRecipe': _i1.MethodConnector(
          name: 'generateRecipe',
          params: {
            'ingredients': _i1.ParameterDescription(
              name: 'ingredients',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['recipe'] as _i2.RecipeEndpoint).generateRecipe(
            session,
            params['ingredients'],
          ),
        ),
        'getRecipes': _i1.MethodConnector(
          name: 'getRecipes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['recipe'] as _i2.RecipeEndpoint).getRecipes(session),
        ),
      },
    );
    connectors['toilet'] = _i1.EndpointConnector(
      name: 'toilet',
      endpoint: endpoints['toilet']!,
      methodConnectors: {
        'uploadToilets': _i1.MethodConnector(
          name: 'uploadToilets',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['toilet'] as _i3.ToiletEndpoint)
                  .uploadToilets(session),
        ),
        'getToilets': _i1.MethodConnector(
          name: 'getToilets',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['toilet'] as _i3.ToiletEndpoint).getToilets(session),
        ),
      },
    );
    connectors['waterStation'] = _i1.EndpointConnector(
      name: 'waterStation',
      endpoint: endpoints['waterStation']!,
      methodConnectors: {
        'uploadWaterStations': _i1.MethodConnector(
          name: 'uploadWaterStations',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['waterStation'] as _i4.WaterStationEndpoint)
                  .uploadWaterStations(session),
        ),
        'getWaterStations': _i1.MethodConnector(
          name: 'getWaterStations',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['waterStation'] as _i4.WaterStationEndpoint)
                  .getWaterStations(session),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
