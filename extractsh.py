import sys

def main():
    print("Reading", sys.argv[1])
    with open(sys.argv[1], "rb") as f:
        s = f.read()
        s = ["\\x" + hex(a)[2::1].zfill(2) for a in s]
        print("Writing to", sys.argv[2])
        with open(sys.argv[2], "wb") as f2:
            f2.write(''.join(s).encode())

if __name__ == "__main__":
    main()
