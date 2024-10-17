class Laptop {
  final String id;
  final String name;
  final String screenSize;
  final String storage;
  final String memory;
  final String processor;
  final String status;

  Laptop({
    required this.id,
    required this.name,
    required this.screenSize,
    required this.storage,
    required this.memory,
    required this.processor,
    required this.status,
  });

  static List<Laptop> getDummyLaptops() {
    return [
      Laptop(
        id: 'LT-001',
        name: 'MacBook Pro 1',
        screenSize: '13"',
        storage: '256GB',
        memory: '8GB',
        processor: 'M1',
        status: 'Available',
      ),
      Laptop(
        id: 'LT-002',
        name: 'MacBook Pro 2',
        screenSize: '14"',
        storage: '512GB',
        memory: '16GB',
        processor: 'M1 Pro',
        status: 'Not Available',
      ),
      Laptop(
        id: 'LT-003',
        name: 'MacBook Pro 3',
        screenSize: '16"',
        storage: '1TB',
        memory: '32GB',
        processor: 'M1 Max',
        status: 'Available',
      ),
      Laptop(
        id: 'LT-004',
        name: 'MacBook Pro 4',
        screenSize: '13"',
        storage: '512GB',
        memory: '16GB',
        processor: 'M2',
        status: 'Not Available',
      ),
      Laptop(
        id: 'LT-005',
        name: 'MacBook Pro 5',
        screenSize: '15"',
        storage: '1TB',
        memory: '32GB',
        processor: 'M2 Pro',
        status: 'Available',
      ),
    ];
  }
}
