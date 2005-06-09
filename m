From: "Ginter, Jeff A" <Jeff.Ginter@ca.com>
Subject: RE: --policy DROP kills everything?
Date: Wed, 8 Jun 2005 23:05:40 -0400
Message-ID: <B80488675062364A909EE60F4A666038078EEA9E@usilms23.ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have seen very similar results.

I have my first rule as Established/Related then I allow out 80, 443,
etc. (just a few ports)...and the web and other traffic dies.

When I tcpdump, I notice that for some of this traffic the s-port and
d-port are no longer matching (they are now high ports) and the
established, related rules don't seem to pick this up.

This is in my forwarding chain (there is a private network behind with 1
to 1 nats).

I added a rule that allowed ALL out, since security is not a concern for
that direction for me in this environment, but I shouldn't have had to
do that.

Let me know if you get anywhere with this Dave.  Thanks.

=20
=20
Jeff Ginter, CISSP
Computer Associates
Mid-Atlantic Consulting Manager
tel:    +1 908 874-9726
cell:   +1 609 577-1494
jeff.ginter@ca.com
=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of David Busby
Sent: Wednesday, June 08, 2005 7:32 PM
To: netfilter@lists.netfilter.org
Subject: Re: --policy DROP kills everything?

Rob Sterenborg wrote:
>=20
> Add this on top of the other INPUT rules :
>=20
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>=20

Ok so I changed the rules to this:

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED
ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
ACCEPT     udp  --  192.168.42.1         192.168.42.2        udp spt:53
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG level
warning

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

But it won't accept new connections on port 80 or 22.  The Established
SSH conection is fine.
I can see new connections to port 80 or 22 in my logs, see:

IN=3Deth0 OUT=3D MAC=3D00:01:03:d2:db:0b:00:11:5b:50:ff:a4:08:00
SRC=3D192.168.42.34 DST=3D192.168.42.2 LEN=3D48 TOS=3D0x00 PREC=3D0x00=20
TTL=3D128 ID=3D18259 DF PROTO=3DTCP SPT=3D3704 DPT=3D80 WINDOW=3D65535 =
RES=3D0x00 SYN
URGP=3D0

IN=3Deth0 OUT=3D MAC=3D00:01:03:d2:db:0b:00:11:5b:50:ff:a4:08:00
SRC=3D192.168.42.34 DST=3D192.168.42.2 LEN=3D48 TOS=3D0x00 PREC=3D0x00=20
TTL=3D128 ID=3D18526 DF PROTO=3DTCP SPT=3D3705 DPT=3D22 WINDOW=3D65535 =
RES=3D0x00 SYN
URGP=3D0

Why they don't jump to accept?  They match a rule.

So then I adjusted #1 above to this

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
NEW,RELATED,ESTABLISHED

Doesn't that now allow any new connection to any port on any protocol
making my FW worthless?
Then I tried moving the RELATED,ESTABLISHED to the last rule like this:

imperium root # iptables -L INPUT -n
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
ACCEPT     udp  --  192.168.42.1         192.168.42.2        udp spt:53
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0
level 4

But I still cannot get new connections in and my estabilshed SSH is
still OK.

Should I not use policy DROP but add a last rule of DROP?  Which is the
"right" way?
I guess I learned so far that I need to accept new and established.  But
I cannot seem to get the rules to work.
I've been up and down the man page and samples but seem to be missing
one more stupid little thing :(
Please help.

/djb




