# PhyloTrees.jl

[![Build Status](https://travis-ci.org/jangevaare/PhyloTrees.jl.svg?branch=master)](https://travis-ci.org/jangevaare/PhyloTrees.jl)

## Introduction

PhyloTrees.jl has two main objectives. The first objective is to provide a simple, fast, and flexible method of simulating genetic sequence data from a specified phylogenetic tree and substitution model. The second is to perform efficient likelihood calculations of phylogenetic trees with native [Julia language](http://julialang.org) code.

Currently the following substitution models are supported by Phylogenetics.jl:
* JC69
* K80
* F81
* F84
* HKY85
* TN93
* GTR
* UNREST

These substitution models may be utilized in conjunction with rate variation amongst nucleotide sites or branches of the phylogenetic tree.

## Installation
    Pkg.update()
    Pkg.add("PhyloTrees")

## Basic usage
Use the PhyloTrees.jl package

    using PhyloTrees

Create a tree with a root node

    tree1 = Tree()

Add additional nodes to the tree

    addnode!(tree1)
    addnode!(tree1)
    addnode!(tree1)

Add branches to the tree, connecting two specific nodes, of a specified length

    addbranch!(tree1, 1, 2., 10.0)
    addbranch!(tree1, 1, 3, 5.0)
    addbranch!(tree1, 3, 4, 20.0)

Simulate sequence data for a specified phylogenetic tree, using a parametrized substitution model

    seq = simulate!(tree1, JC69([1.0e-5]), 1000)
