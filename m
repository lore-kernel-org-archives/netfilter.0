From: TheOldFellow <theoldfellow@gmail.com>
Subject: Re: www.adobe.com
Date: Thu, 13 Nov 2008 10:52:05 +0000
Message-ID: <20081113105205.7496faf5@gmail.com>
References: <20081113075231.50345b2c@gmail.com>
	<491BFB25.3000800@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Thu, 13 Nov 2008 11:02:13 +0100
Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:

> Hello,
>=20
> TheOldFellow a =C3=A9crit :
> >=20
> > # wget http://www.adobe.com/index.html
> > --07:45:04--  http://www.adobe.com/index.html
> >            =3D> `index.html'
> > Resolving www.adobe.com... 192.150.18.101
> > Connecting to www.adobe.com|192.150.18.101|:80...=20
> >=20
> > it just times out - browsers are the same.
<snip>
>=20
> Wget hanging after printing "Connecting to..." but before printing=20
> "connected" seems to indicate that it didn't receive a SYN/ACK packet=
=20
> from the server in response to its SYN packet. However the logged and=
=20
> dropped packets do not look like SYN/ACK packets, as they do not have=
=20
> the SYN and ACK flags set.
>=20
> Can you provide a capture of the resulting traffic from and to=20
> 192.150.18.101 on interface 'net' with tcpdump, tshark or wireshark w=
hen=20
> running wget ? E.g.
>=20
> # tcpdump -nvi net host 192.150.18.101
>=20
> Does the problem happen if you temporarily allow all input traffic (a=
t=20
> least from 192.150.18.101) ? E.g.
>=20
> # iptables -I INPUT -s 192.150.18.101 -j ACCEPT


Thanks, and to everyone else who tried to help.

I didn't know about tcpdump, so I had to build and install it first.
The output when executing the wget above is:

$ sudo /usr/sbin/tcpdump -nvi net host 192.150.18.101
tcpdump: listening on net, link-type EN10MB (Ethernet), capture size 68=
 bytes 10:45:28.743810 IP (tos 0x0, ttl 64, id 55527, offset 0, flags [=
DF], proto TCP (6), length 60)
    192.168.1.2.2901 > 192.150.18.101.80: Flags [S], seq 3678776487, wi=
n 5840, options [mss 1460,sackOK,TS[|tcp]>
10:45:28.932756 IP (tos 0x0, ttl 53, id 25304, offset 0, flags [none], =
proto TCP (6), length 44)
    192.150.18.101.80 > 192.168.1.2.2901:  tcp 24 [bad hdr length 0 - t=
oo short, < 20]
10:45:31.741831 IP (tos 0x0, ttl 64, id 55528, offset 0, flags [DF], pr=
oto TCP (6), length 60)
    192.168.1.2.2901 > 192.150.18.101.80: Flags [S], seq 3678776487, wi=
n 5840, options [mss 1460,sackOK,TS[|tcp]>
10:45:31.930558 IP (tos 0x0, ttl 53, id 46986, offset 0, flags [none], =
proto TCP (6), length 44)
    192.150.18.101.80 > 192.168.1.2.2901:  tcp 24 [bad hdr length 0 - t=
oo short, < 20]
10:45:37.741754 IP (tos 0x0, ttl 64, id 55529, offset 0, flags [DF], pr=
oto TCP (6), length 60)
    192.168.1.2.2901 > 192.150.18.101.80: Flags [S], seq 3678776487, wi=
n 5840, options [mss 1460,sackOK,TS[|tcp]>
<snip>
18 packets captured
18 packets received by filter
0 packets dropped by kernel

Allowing all input doesn't change a thing.  Did I capture enough?

Regards,
R.




