From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: netfilter .. (openswan) nat problem ..
Date: Wed, 7 Jun 2006 13:36:07 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C4012793@knowledge.wizdom.nu>
References: <01e101c689ac$45d82050$c964a8c0@sol>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: ji'e'toh <jietoh@o2online.de>, netfilter@lists.netfilter.org

In addition to NAT, do you also ACCEPT the traffic in the FORWARD chain =
of the FILTER table?
=20
Your second NAT rule: iptables -t nat -A POSTROUTING -j SNAT -p tcp -d =
192.168.0.100 --dport 50000
--to 100.100.100.100 -o eth0
--dport should be --sport otherwise return traffic will not work.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of ji'e'toh
Sent: Tue 06-Jun-06 23:00
To: netfilter@lists.netfilter.org
Subject: netfilter .. (openswan) nat problem ..



i have to solv the following problem (debian 3.1, kernel 2.6.14 from =
kernel
org, no patches, openswan 2.x.x maybe important):

netA - gwA - gwB - netB - internet, where

netA: 192.168.0.0/24
gwA: 192.168.0.1 + pppoe-ip-addr
gwB: 100.100.100.100 (static official ip)
netB: 100.100.100.100/32 (no real subnet)

gwA and gwB are both real gateways

tunnel works in the following way:

netA/gwA to netB/gwB and netB/gwB to netA/gwA, all I think .

now I want to forward a spezial port on gwB, perhaps 50000 to an address =
in
netA (192.168.0.100:50000), ok np from gwB, but ! I could not connect =
from
the internet over gwB to this spezial host

my nat rules, nothing else ..

iptables -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 50000
--to-destination 192.168.0.100:50000 -i eth0
iptables -t nat -A POSTROUTING -j SNAT -p tcp -d 192.168.0.100 --dport =
50000
--to 100.100.100.100 -o eth0

tcpdump tell me that all nat works, but no traffic on gwA interfaces
received. gwB send it, but I have a [DF] in that lines, maybe important, =
I
doesn't know

any suggestions? someone could help?



regards, ji









