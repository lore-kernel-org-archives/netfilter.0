From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Sun, 03 Sep 2006 19:35:36 +0200
Message-ID: <44FB1268.4000102@plouf.fr.eu.org>
References: <20060831151130.GA32342@freesources.org>	<000601c6cd14$e07a28a0$0101000a@tanjian>	<20060831155749.GC32342@freesources.org>	<44F711D4.5090002@plouf.fr.eu.org>	<20060901012054.GB23094@freesources.org>	<44F7996C.9010504@plouf.fr.eu.org>	<20060902142712.GA31352@freesources.org>	<44F9A071.7070603@plouf.fr.eu.org>
	<20060903162926.GA4573@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060903162926.GA4573@freesources.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Jonas Meurer a =E9crit :
>>
>>>i would like to support both active and passive mode.
>>
>>To allow active mode you'll have to perform two actions :
[...]

I meant "passive", of course.

> this is a big problem, as the ftp-server does not seem to support any
> other configuration than ip and port to listen on. it's the internal
> zope ftp-server (Medusa Async V1.23 [experimental]).

Well, so I'm afraid that you have to forget about passive mode, unless=20
you allow incoming connections to the whole port range defined in=20
/proc/sys/net/ipv4/ip_local_port_range. I guess it is not what you want.

> now i used the following rules:
> iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED \
>   -m multiport -p tcp --dports 9621,9721 -d 62.75.128.98/31 -j ACCEPT
> iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED \
>   -m multiport -p tcp --sports 9621,9721 -s 62.75.128.98/31 -j ACCEPT
> iptables -A INPUT -i eth0 -m state --state ESTABLISHED \
>   -m multiport -p tcp --dports 9620,9720 -d 62.75.128.98/31 -j ACCEPT
> iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED \
>   -m multiport -p tcp --sports 9620,9720 -s 62.75.128.98/31 -j ACCEPT
>=20
> unfortunately i still get the same result, both with passive and active
> ftp.
> i understand why passive ftp doesn't work, the ports are simply not ope=
n
> for the passive connection. but why does active ftp still not work? i
> tried from different servers without firewall and without a nat router,
> so the client cannot be the problem at all.
>=20
> do you have any further suggestions?

Run a packet sniffer on the server, start a local FTP session in active=20
mode, watch the traffic and check that the data connection uses port=20
9620/9621 as expected.

Run a packet sniffer on both the client and the server and watch the FTP=20
session.

If acceptable, try to allow by address any traffic between your client=20
and the server.

I noticed that your client had a private IP address 192.168.x.x. Is=20
there a NAT device between the client and the server ? If yes, is this=20
NAT device aware that you do FTP on non standard ports ?

What is the delay between the two following lines during a LIST attempt=20
in active mode :

> <--- 150 Opening ASCII mode data connection for file list
> <--- 426 Connection closed; transfer aborted

No delay ?
Some delay ?
Hang until you abort ?

