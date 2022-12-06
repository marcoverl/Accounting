#!/usr/bin/python

import getopt
import requests
import sys

__author__ = "Lisa Zangrando"
__email__ = "lisa.zangrando[AT]pd.infn.it"
__copyright__ = """Copyright (c) 2017 INFN - West-Life
All Rights Reserved

Licensed under the Apache License, Version 2.0;
you may not use this file except in compliance with the
License. You may obtain a copy of the License at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied.
See the License for the specific language governing
permissions and limitations under the License."""


def main(argv):
    input_file = None
    output_file = None

    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print("accounting.py -i <inputfile> [-o <outputfile>]")
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
           print("accounting.py -i <inputfile> [-o <outputfile>]")
           sys.exit()
        elif opt in ("-i", "--ifile"):
           input_file = arg
        elif opt in ("-o", "--ofile"):
           output_file = arg

    r = requests.get(input_file)

    if output_file:
        with open(output_file, "w") as text_file:
            text_file.write(r.content)
    else:
        print(r.content)

if __name__ == "__main__":
   main(sys.argv[1:])
