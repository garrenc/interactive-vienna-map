# Interactive Map Vienna

An interactive map application for Vienna that displays various points of interest including toilets, water fountains, charging stations, WiFi spots, and audio guides.

## 🏗️ Architecture

This project follows a **client-server architecture** with three main components:

- **Flutter Client App** - Cross-platform mobile application
- **ServerPod Backend** - Dart-based server with PostgreSQL database
- **Shared Client Library** - Protocol definitions and data models

## 🚀 Technology Stack

### Frontend (Mobile App)
- **Framework**: [Flutter](https://flutter.dev/) - Cross-platform UI framework
- **Language**: [Dart](https://dart.dev/) - Programming language
- **State Management**: [Riverpod](https://riverpod.dev/) - State management solution
- **Maps**: [MapLibre GL](https://maplibre.org/) - Open-source mapping library
- **HTTP Client**: [http](https://pub.dev/packages/http) - HTTP requests

### Backend
- **Framework**: [ServerPod](https://serverpod.dev/) - Dart-based server framework
- **Language**: [Dart](https://dart.dev/) - Server-side Dart
- **Database**: [PostgreSQL](https://www.postgresql.org/) - Relational database
- **ORM**: ServerPod's built-in database layer
- **API**: RESTful endpoints with JSON communication
- **Development Tunneling**: [ngrok](https://ngrok.com/) - Secure tunnels for local development


- **CI/CD**: Automated deployment scripts

### Development Tools
- **Package Manager**: [pub](https://dart.dev/tools/pub) - Dart package management
- **Code Generation**: [build_runner](https://pub.dev/packages/build_runner) - Code generation
- **Linting**: [analysis_options.yaml](https://dart.dev/guides/language/analysis-options) - Dart analyzer configuration
- **Testing**: [dart_test](https://dart.dev/guides/testing) - Testing framework

## 📱 Features

### Core Functionality
- **Interactive Map**: Real-time map with custom markers
- **Point of Interest Types**:
  - 🚻 Toilets
  - 💧 Water Fountains
  - 🔌 Charging Stations
  - 📶 WiFi Spots
  - 🎧 Audio Guides
- **Location Services**: GPS tracking and user location centering
- **Custom Markers**: Type-specific icons with colors and labels
- **Bottom Sheet**: Detailed information display for each point

### Technical Features
- **Nearby Point Filtering**: Removes duplicate points within 100 meters
- **Responsive UI**: Adaptive design for different screen sizes
- **Offline Support**: Cached data and graceful error handling
- **Performance**: Efficient marker rendering and map interactions

## 🏛️ Project Structure

```
interactive_map_vienna/
├── interactive_map_vienna_client/     # Shared client library
│   ├── lib/src/protocol/             # Protocol definitions
│   ├── lib/src/recipes/              # Recipe data models
│   ├── lib/src/toilets/              # Toilet data models
│   └── lib/src/waterStations/        # Water station data models
├── interactive_map_vienna_flutter/    # Flutter mobile app
│   ├── lib/screens/                  # App screens
│   ├── lib/widgets/                  # Reusable UI components
│   ├── lib/providers/                # State management
│   ├── lib/services/                 # Business logic services
│   └── lib/models/                   # Data models
└── interactive_map_vienna_server/     # ServerPod backend
    ├── lib/src/endpoints/            # API endpoints
    ├── lib/src/recipes/              # Recipe business logic
    ├── lib/src/toilets/              # Toilet business logic
    ├── lib/src/waterStations/        # Water station business logic
    ├── migrations/                   # Database migrations
    └── deploy/                       # Deployment configurations
```

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0+)
- [Dart SDK](https://dart.dev/get-dart) (3.0+)
- [PostgreSQL](https://www.postgresql.org/download/) (13+)
- [ServerPod CLI](https://serverpod.dev/docs/getting-started/installation)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd interactive_map_vienna
   ```

2. **Setup the backend**
   ```bash
   cd interactive_map_vienna_server
   serverpod generate
   serverpod run
   ```

3. **Setup the Flutter app**
   ```bash
   cd interactive_map_vienna_flutter
   flutter pub get
   flutter run
   ```

4. **Setup the client library**
   ```bash
   cd interactive_map_vienna_client
   dart pub get
   ```

### Environment Configuration

Create environment-specific configuration files in the server directory:
- `config/development.yaml` - Development settings
- `config/production.yaml` - Production settings

### Development with ngrok

For local development and testing with external services:
1. Start your ServerPod server locally
2. Use ngrok to create a secure tunnel: `ngrok http 8080`
3. Update the `_baseUrl` in your client code with the ngrok URL
4. This allows you to test your app on physical devices while developing locally

## 🗄️ Database Schema

The application uses PostgreSQL with the following main entities:
- **Toilets**: Location, description, accessibility info
- **Water Stations**: Location, water quality, operating hours
- **Recipes**: Local recipes and food information
- **Charging Stations**: EV charging points
- **WiFi Spots**: Public WiFi locations
- **Audio Guides**: Tourist information and audio content

## 🧪 Testing

```bash
# Run all tests
dart test

# Run specific test files
dart test test/unit/
dart test test/integration/
```

## 🚀 Deployment

### AWS Deployment
```bash
cd interactive_map_vienna_server/deploy/aws
terraform init
terraform plan
terraform apply
```

### GCP Deployment
```bash
cd interactive_map_vienna_server/deploy/gcp
terraform init
terraform plan
terraform apply
```

## 🔧 Development

### Code Generation
```bash
# Generate ServerPod code
serverpod generate

# Generate Flutter code
flutter packages pub run build_runner build
```

### Adding New Features
1. Define data models in the client library
2. Create server endpoints
3. Implement Flutter UI components
4. Add tests
5. Update documentation

## 📊 Performance Considerations

- **Marker Clustering**: Nearby points are filtered to reduce map clutter
- **Image Caching**: Marker images are cached for better performance
- **Lazy Loading**: Data is loaded on-demand
- **Efficient Rendering**: MapLibre GL provides hardware-accelerated rendering

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [ServerPod](https://serverpod.dev/) team for the excellent backend framework
- [MapLibre](https://maplibre.org/) for open-source mapping
- [Flutter](https://flutter.dev/) team for cross-platform development
- Vienna Open Data for providing public facility information

## 📞 Support

For questions and support:
- Create an issue in the repository
- Check the [ServerPod documentation](https://serverpod.dev/docs)
- Review [Flutter documentation](https://flutter.dev/docs) 