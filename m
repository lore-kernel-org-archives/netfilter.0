From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: new tcp connections, without SYN
Date: 11 Apr 2003 10:37:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050050273.5564.15.camel@elendil.intranet.cartel-securite.net>
References: <7497DCA1C240C042B28F6657ADFD8E09268777@i2km11-ukbr.domain1.systemhost.net>
	 <1049964481.790.4.camel@elendil.intranet.cartel-securite.net>
	 <3E95AF83.5050508@iatp.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E95AF83.5050508@iatp.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Rahul Jadhav <rahul@iatp.org>
Cc: netfilter@lists.netfilter.org

Le jeu 10/04/2003 =E0 19:53, Rahul Jadhav a =E9crit :
> I have been following your messages for a  while now and I tried the '!=
=20
> --syn' and '--state NEW, RELATED' rule without much success. I am tryin=
g=20
> to completely block the nmap -P0 and -PS probes.

man nmap :
[...]
       -P0    Do not try and ping hosts at all before scanning
	      them. This allows the scanning of networks that don't
	      allow ICMP echo requests (or responses) through their
	      firewall. microsoft.com is an example of such a network,
	      and thus you should always use -P0 or -PT80 when
	      portscanning microsoft.com.
[...]
       -PS    This option uses SYN (connection request) packets instead
	      of ACK packets for root users.  Hosts that are up should
	      respond with a RST (or, rarely, a SYN|ACK). You can set
	      the destination ports in the same manner as -PT above.
[...]

-PT is a TCP scan using ACK.

So, there's nothing to do to avoid a scan using -P0 for it does not
probe before scanning. You have to concentrate on detecting the scan
itself, using POM psd match or any userland tool that achieve this, and
then block it before its end.

It is about the same for -PS. You are able to block -PT scans blocking
NEW TCP packets that would not be SYN ones, but as -PS uses a SYN
packet, it uses a valid packet that is to be answered. So, if you're
probed against an opened port, you can't do anything, and as for -P0,
you have to concentrate on port scan itself.

Imho, port scanning blocking is a very tough feature to implement, as
there is a lot scanning technics, with various parameters such as
timing, multiple sources usage, decoys, etc. I prefer concentrate on a
good filtering ruleset, and let others scan. They will discover what
services they're allowed to access ;)

> And, also someone please write back rules to block port scans (do I HAV=
E=20
> to block ICMP completely for that?).

Netfilter's conntrack achieves ICMP errors handling very well.. When an
ICMP error is recieved, it is labeled RELATED if conntrack can associate
it to an existing IP flow. If not, it's RELATED. So, you can safely drop
all ICMPs that are not RELATED (INVALID packets should be droped
anyway).

ICMP echos, timestamp, netmask and info are treated with NEW/ESTABLISH
states, as they implies requests and responses. It is harmless to drop
them all.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

