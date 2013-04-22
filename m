From: Husnu Demir <hdemir@metu.edu.tr>
Subject: Re: Fwd: ipset and counters
Date: Mon, 22 Apr 2013 17:03:27 +0300
Message-ID: <5175432F.2060304@metu.edu.tr>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 22-04-2013 16:57, Jozsef Kadlecsik wrote:
> On Mon, 22 Apr 2013, Husnu Demir wrote:
> 
>> I want to give a try for COUNTERS properties of IPSET. But I
>> could not manage it;
>> 
>> # ipset create COUNTERS bitmap:ip  counters ipset v6.17: Unknown
>> argument: `counters' Try `ipset help' for more information.
> 
> What does "ipset help bitmap:ip" says? I suspect you have multiple
>  binaries at different paths.

# ipset help bitmap:ip
ipset v6.17

Usage: ipset [options] COMMAND


..

bitmap:ip type specific options:

create SETNAME bitmap:ip range IP/CIDR|FROM-TO
               [netmask CIDR] [timeout VALUE] [counters]
add    SETNAME IP|IP/CIDR|FROM-TO [timeout VALUE]
               [packets VALUE] [bytes VALUE]
del    SETNAME IP|IP/CIDR|FROM-TO
test   SETNAME IP

where IP, FROM and TO are IPv4 addresses (or hostnames),
      CIDR is a valid IPv4 CIDR prefix.

Type bitmap:ip supports family INET only.



hdemir.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQEcBAEBAgAGBQJRdUMvAAoJEISpBAM51qlE6m0H/0gjbvn41sIYniv4MscakUsh
lPZ1qu6eqWBxHC1GZUqkVMCcE0/+XpL+8R3cp4SC9p1tpX9l46jPKipiKdKki/vx
QbOs/LaMniQtadkkAs5hnDCX9k40OE4m3SAQfpQG0Vf9MlYnedUsEbEe9Hq38Wc+
8wJrrEqGJywdfjsiVHiBqu1nQs51vQ14wos42KyoUiz0YHh20O91H0AxSZlhm6Mq
4UDj4SZKO9AVIz2KyPPIZhOq/vjvgkP0d7CX5mmDsyuZaNxc30RTNzNJ8ItgWNM9
sVdNRCFNtLUOxq8E/opbU/aCZvGgGbmYLGKeexdElL44koFVyHHyNRjHPAQhiSk=
=VGvw
-----END PGP SIGNATURE-----
