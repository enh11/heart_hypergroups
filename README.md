# Heart Hypergroups and Hv-groups

A mathematical exploration of hypergroups and Hv-groups with a focus on the computation of the fundamental group and the heart.


## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Functions](#functions)
- [Example](#example)

## Overview

This repository includes some basic functions to work with hypercompositional structures. In particualre we include:

- **Hyperoperation**: Defines a binary operation on a set H.
- **Associativity Check**: Verifies if a hyperoperation is associative.
- **Reprocudtivity Check**: Verifies if a hyperoperation is associative.
- **Weak Associativity Check**: Verifies if a hyperoperation is weakly associative.
- **Identity Elements**: Identifies identities in a hypercompositional structure, including partial identities.
- **$\beta$ relation and transitive closure**: Computes the beta relation of a hypergroupoid.
- **Fundamental group and heart**: Computation of the quotient hypergroupoid given by the $\beta^\star$-classes.

The primary focus is the computation of the heart of Hv-group and hypergroup. 

## Installation

To use this repository, clone it to your local machine:

```bash
git clone https://github.com/enh11/heart_hypergroups.git
cd heart_hypergroups
```
## Usage
Open MATLAB or GNU Octave and navigate to the repository folder.
You can use the functions in this repository by calling the relevant scripts or functions. For example:

```matlab
% Define a set H
H = {'a','b','c'};

% Define a hyperoperation table as a cell array
cayley_table = {
    {'a'}, {'a', 'b'}, {'a', 'c'};
    {'a','b'}, {'b'}, {'b', 'c'};
    {'a','b','c'}, {'a', 'b','c'}, {'c'};
};

% Compute hyperoperation between elements in H
hyperoperation(H,cayley_table, 'a','b')
% Compute the product between two subsets of H
set_operation(H,cayley_table,{'a','b'},{'c'})
% Check associativity
is_associative(H,cayley_table)
```
## Functions

The repository includes the following core MATLAB functions:

- **`hyperoperation.m`**  
  Performes the hyperoperation between to elements in $H$.
- **`set_hyperoperation.m`**
  Performes the operation between to subset of $H$.

- **`is_associative.m`**  
  Checks if the hyperoperation is associative. Returns `true` if the operation satisfies associativity for all elements, otherwise `false`.

- **`is_reproductive.m`**  
  Checks if the hyperoperation is reproductive, meaning each element can be “reproduced” under the operation.

- **`is_weakly_associative.m`**  
  Verifies weak associativity of the hyperoperation.

- **`collect_identities.m`**  
  Finds identities elements in the hypercompositional structure.

- **`beta_relation.m`**  
  Computes the β relation for a hypergroupoid.  

  **Inputs:**  
  - `H` – A vector representing the set of elements in the hypergroupoid, e.g., `[0 1 2]`.  
  - `table` – A cell array representing the Cayley table (hyperoperation table), where `table{i,j}` gives the set of results of the operation on elements `H(i)` and `H(j)`.  

  **Output:**  
  - `beta` – A cell array containing the set of pairs `(x, y)` such that `x` and `y` are β-related according to the hypergroupoid structure.  


- **`transitive_closure.m`**  
  Finds the transitive closure of the a relation. This is applied to the $\beta$ relation in order to get $\beta^\star$.

- **`fundamental_group.m`**  
  Computes the fundamental group of the hyperstructure based on the β relation and transitive closure.

- **`heart.m`**  
  Computes the heart hypergroup. This is the $\beta^\star$ class of a partial identity

## Example: Computing the Heart of a Hypergroup

This example demonstrates how to compute the **heart** of an Hv-group or hypergroup using MATLAB.

```matlab
% Define the set of elements
Hv_10 = {'a', 'b', 'c', 'd','e','f','g','h','i','j'};

% Define the Cayley table (hyperoperation table)
Mv_10 = {
        {'a'},{'b'},{'c'},{'d'},{'e'},{'a','f'},{'g'},{'h'},{'i'},{'j'},
        {'b'},{'c'},{'d'},{'e'},{'f'},{'g'},{'h'},{'i'},{'j'},{'a'},
        {'c'},{'d'},{'e'},{'f'},{'g'},{'h'},{'i'},{'j'},{'a'},{'b'},
        {'d'},{'e'},{'f'},{'g'},{'h'},{'i'},{'j'},{'a'},{'b'},{'c'},
        {'e'},{'f'},{'g'},{'h'},{'i'},{'j'},{'a'},{'b'},{'c'},{'d'},
        {'a','f'},{'g'},{'h'},{'i'},{'j'},{'a'},{'b'},{'c'},{'d'},{'e'},
        {'g'},{'h'},{'i'},{'j'},{'a'},{'b'},{'c'},{'d'},{'e'},{'f'},
        {'h'},{'i'},{'j'},{'a'},{'b'},{'c'},{'d'},{'e'},{'f'},{'g'},
        {'i'},{'j'},{'a'},{'b'},{'c'},{'d'},{'e'},{'f'},{'g'},{'h'},
        {'j'},{'a'},{'b'},{'c'},{'d'},{'e'},{'f'},{'g'},{'h'},{'i'}
};

% Compute the heart using the heart_hv.m function
heart = heart_hv(Hv_10, Mv_10);

% Display the result
heart
