{ mkDerivation, base, bytestring, c2hs, containers, hspec, rdkafka
, stdenv, unix
}:
mkDerivation {
  pname = "haskakafka";
  version = "0.2.0.1";
  src = ./.;
  buildDepends = [ base bytestring containers unix ];
  testDepends = [ base bytestring hspec ];
  buildTools = [ c2hs ];
  extraLibraries = [ rdkafka ];
  preConfigure = "sed -i -e /extra-lib-dirs/d -e /include-dirs/d haskakafka.cabal";
  configureFlags =  "--extra-include-dirs=${rdkafka}/include/librdkafka";
  doCheck = false;
  doHaddock = false;
  homepage = "http://github.com/cosbynator/haskakafka";
  description = "Kafka bindings for Haskell";
  license = stdenv.lib.licenses.mit;
}
