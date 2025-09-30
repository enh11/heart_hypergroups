# Heart Hypergroups and Hv-groups

A mathematical exploration of hypergroups and Hv-groups with a focus on the computation of the fundamental group and the heart.


## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Functions](#functions)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

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
