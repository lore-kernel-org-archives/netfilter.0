From: Husnu Demir <hdemir@metu.edu.tr>
Subject: Fwd: ipset and counters
Date: Mon, 22 Apr 2013 15:46:59 +0300
Message-ID: <51753143.8090908@metu.edu.tr>
References: <51752B00.8090908@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51752B00.8090908@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi,

I want to give a try for COUNTERS properties of IPSET. But I could not
manage it;

# ipset create COUNTERS bitmap:ip  counters
ipset v6.17: Unknown argument: `counters'
Try `ipset help' for more information.


# man ipset
..
..
   counters, packets, bytes
       All set types support the optional counters option when
creating a set. If the option is specified then the set is created
with packet and byte counters per element support. The packet and byte
 counters  are  initialized  to
       zero when the elements are (re-)added to the set, unless the
packet and byte counter values are explicitly specified by the packets
and bytes options. An example when an element is added to a set with
non-zero counter values:

              ipset create foo hash:ip counters

              ipset add foo 192.168.1.1 packets 42 bytes 1024

..


I could not set counters. How can I activate it?

I used ipset-20130422 BUILD. And;

# autogen.sh
# ./configure
# make
# make install
# make CONFIG_IP_SET_MAX=2048 modules
# make CONFIG_IP_SET_MAX=2048 modules_install

# ipset -V
ipset v6.17, protocol version: 6

There is a ipset v6.18 bu daily build says 6.17.


Please help.

Thanks in advance.

Husnu Demir.
Network.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQEcBAEBAgAGBQJRdTFDAAoJEISpBAM51qlEP1oH+wfBPOQLmmU8wD+EQ83fUx85
u62Rj0S189piWKNzc4Mb/TijHjDLelGuems7CMGvlqsxSBQQtltog8+15n/GmP3I
jeIGXjg4q638ax6+04q+zZwjIm7uF3axWUBuoAhEJgcf0bjjJVXg7QDJTdwWTgU0
jJVRK01NbdIT32PqmpLvlq0CtovtsOmwfv98ENVHqUPyiUjcJuzBh1SjMvZgFO6G
94tez2gevM0mRjz8Dq5J2nxzE6zlsQlGI7mQA7NHW84pTGAgeil2UG1SJV2+mlAL
m2GbOL5b2bUQrtNXdLV/00EMlYOj4nZ3vhzAd0rptDKV21SiabP8pVCeQlvXI9w=
=bLRy
-----END PGP SIGNATURE-----
