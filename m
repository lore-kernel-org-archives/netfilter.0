From: "melim" <melim@softexpert.com>
Subject: Maybe a Newbie question about SNAT/DNAT
Date: Thu, 12 May 2005 18:44:09 -0300
Message-ID: <001701c5573b$bb21d210$0bc8a8c0@DES007>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I had some problems trying to set up my DMZ using iptables.

I have a valid IP in a interface eth2 and a internal net ip on eth0, I'm
using some well documented rules to redirect port requisitions to another
internal server.

iptables -t nat -A PREROUTING -p tcp --dport 80 -d 200.180.X.X -j
DNAT --to-destination 192.168.200.251
iptables -t nat -A POSTROUTING -p tcp --sport 80 -s 192.168.200.251 -j
SNAT --to-source 200.180.X.X

Sniffing with tcpdump in my webserver (192.168.200.251), I saw that the
requisition packets are comming.
But, there is no answer back to my browser or whatever.

I=B4ve put a LOG on postrouting in the "router" machine, and I can't see
anything comming back from the webserver, nether through tcpdump.

On the webserver I have a default gateway defined to another router, but
even removing it, won't work.
Only works when I defined the default GW to my router machine, but I don'=
t
want to do this.

I'll be gratefull for any help,

and sorry for my poor english.



