import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatrixScalarMultiply extends StatefulWidget {
  const MatrixScalarMultiply({Key? key}) : super(key: key);

  @override
  _MatrixScalarMultiplyState createState() => _MatrixScalarMultiplyState();
}

class _MatrixScalarMultiplyState extends State<MatrixScalarMultiply> {
  List<List<int>> matrix1 = [];
  List<List<int>> matrix2 = [];

  final _rowsController = TextEditingController();
  final _textControllerForN = TextEditingController();
  List<List<int>> _createEmptyMatrix(int rows) {
    List<List<int>> matrix = [];
    for (int i = 0; i < rows; i++) {
      matrix.add(List.filled(rows, 0));
    }
    return matrix;
  }

  void _clearUI() {
    _rowsController.clear();
    setState(() {});
  }

  void _clearInputs() {
    matrix1 = _createEmptyMatrix(matrix1.length);
    setState(() {});
  }

  // void _clearControllers() {
  //   for (TextEditingController controller in _controllers) {
  //     controller.clear();
  //   }
  // }

  Widget _buildMatrixInput(int rows, List<List<int>> matrix) {
    return Column(
      children: List.generate(rows, (i) {
        return Row(
          children: List.generate(rows, (j) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: matrix[i][j].toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    matrix[i][j] = int.tryParse(value) ?? 0;
                  },
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Matrix Addition')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _rowsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of rows',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                int rows = int.tryParse(value) ?? 0;
                matrix1 = _createEmptyMatrix(rows);
                matrix2 = _createEmptyMatrix(rows);
                //_clearInputs();
                //_clearUI();
                //_clearControllers();
                setState(
                    () {}); // Add this to update the UI after resetting matrices
              },
            ),
            SizedBox(height: 16.0),
            Text('Matrix 1'),
            _buildMatrixInput(matrix1.length, matrix1),
            SizedBox(height: 16.0),
            Text('Enter scallar value'),
            Flexible(
              child: TextFormField(
                controller: _textControllerForN,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter N',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<List<int>> result = [];
                for (int i = 0; i < matrix1.length; i++) {
                  List<int> row = [];
                  for (int j = 0; j < matrix1.length; j++) {
                    row.add(
                        matrix1[i][j] * int.parse(_textControllerForN.text));
                  }
                  result.add(row);
                  Navigator.of(context).pushNamed('/matrix_scalar_multiply',
                      arguments: 'actionName');
                }
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Result'),
                    content: _buildMatrixInput(result.length, result),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Multiply!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
