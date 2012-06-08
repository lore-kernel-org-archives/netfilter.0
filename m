From: Stephane Chazelas <stephane.chazelas@gmail.com>
Subject: Re: How to obtain KBytes/sec in/out from a rule in real time
Date: Fri, 8 Jun 2012 13:33:01 +0100
Message-ID: <20120608123301.GA13651@chaz.gmail.com>
References: <20120608003037.0ud7f668g84kgk4c@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120608003037.0ud7f668g84kgk4c@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2012-06-08 00:30:37 -0600, Jos=E9 Pablo P=E9rez:
> HellO!
>=20
> Anybody know if a tool or script exists out there to obtain the
> KBytes/sec in/out from a rule in real time
>=20
> In other words something that can parse something like this:
>=20
> # iptables -L INET_IN_PORT -v -x
> # iptables -L INET_IN_PORT -v -x -n
[...]

You could do things like:

a=3D$(tput clear) perl -e 'while (1) {
  open IT, "-|", "iptables", "-vxnL", "INPUT";
   $. =3D 0; print $ENV{a};
   while (<IT>) {
      s{^\s*(\d+)\s+(\d+)}{
        $n =3D ($1-$a[$.]) . " " . ($2-$b[$.]);
        $a[$.]=3D$1;
        $b[$.] =3D $2;
        $n
      }e;
      print
   };
   close IT;
   sleep 1}'

as a first approximation.

--=20
Stephane

