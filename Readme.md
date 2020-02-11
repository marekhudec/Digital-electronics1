## Online simulator

    ![and_gates](../../Images/simulator_basic_gates.png)

    | **A** | **NOT** |
    | :-: | :-: |
    | 0 | 1 |
    | 1 | 0 |

    | **A** | **B** | **AND** | **NAND** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 |
    | 0 | 1 | 0 | 1 |
    | 1 | 0 | 0 | 1 |
    | 1 | 1 | 1 | 0 |

    | **A** | **B** | **OR** | **NOR** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 |
    | 0 | 1 | 1 | 0 |
    | 1 | 0 | 1 | 0 |
    | 1 | 1 | 1 | 0 |

    | **A** | **B** | **XOR** | **XNOR** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 |
    | 0 | 1 | 1 | 0 |
    | 1 | 0 | 1 | 0 |
    | 1 | 1 | 0 | 1 |
3. Use online simulator and verify De Morgan's laws.

   ![equation](https://latex.codecogs.com/gif.latex?f%20%3D%20a%5Ccdot%20%5Coverline%7Bb%7D%20&plus;%20%5Coverline%7Bb%7D%5Ccdot%20%5Coverline%7Bc%7D)

    &nbsp;

    ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D%20%3D)
    
    &nbsp;
    
    ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D%20%3D)
    
    &nbsp;

    | **A** | **B** |**C** | ![equation](https://latex.codecogs.com/gif.latex?f) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D) |
    | :-: | :-: | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 | 1 | 1 |
    | 0 | 0 | 1 | 0 | 0 | 0 |
    | 0 | 1 | 0 | 0 | 0 | 0 |
    | 0 | 1 | 1 | 0 | 0 | 0 |
    | 1 | 0 | 0 | 1 | 1 | 1 |
    | 1 | 0 | 1 | 1 | 1 | 1 |
    | 1 | 1 | 0 | 0 | 0 | 0 |
    | 1 | 1 | 1 | 1 | 0 | 0 |
