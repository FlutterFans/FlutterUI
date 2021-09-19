```dart
FContainer(
    axis: Axis.horizontal,
    children: [
        FAside(
        color: Colors.green,
        child: Text('FAside'),
        ),
        FContainer(
        axis: Axis.vertical,
        children: [
            FHeader(
            color: Colors.red,
            child: Text('FHeader'),
            ),
            FMain(
            color: Colors.blue,
            child: Text('FMain'),
            ),
            FFooter(
            color: Colors.yellow,
            child: Text('FFooter'),
            ),
        ],
        ),
    ],
)
```