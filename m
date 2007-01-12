From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Need to solve a NAT problem, any takers.
Date: Thu, 11 Jan 2007 19:35:39 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
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
To: netfilter@lists.netfilter.org

Hello,=20

I just setup a new firewall that works well but we ran into a loop with
NAT.  We have a single public IP address which we have to route a web
server, DNS and MTA server through.  These are all on different internal
IP's.  We use PREROUTING DNAT for the IP's coming in.  This works fine.

Internally our DNS server are split giving us internal IP's when queried
internally and external's when queried externally.  This works fine.
Our second DNS server internally slaves the primary.  Because we are
using this split functionality when it slaves the internal IP's it gets
the internal IP configuration.  Works great.  But in order to replicate
the external range it must do so by replicating from the external IP.
This fails at the IP's is NAT'd in by port only.  Years ago we solved
this by running a second POSTROUTING rule and an OUTPUT rule on the
firewall.  When I load these rules now=20

Jan 11 18:11:41 hsfiw01 kernel: NAT: no longer support implicit source
local NAT
Jan 11 18:11:41 hsfiw01 kernel: NAT: packet src 10.40.0.13 -> dst
80.80.80.66

I understand that this is now expected functionality in the 2.6.11+
kernels.  We are running 2.6.16 (which we kind of stuck on right now).

Is there a way to run work around this problem to allow internal
machines to use the external NAT'd IP via specific port to access the
proper machine inside?

Here is something that I derived from an older config, but obviously the
POSTROUTING isn't working.

-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 80     -j DNAT
--to-destination 10.40.0.12:80
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 443    -j DNAT
--to-destination 10.40.0.12:443
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 25     -j DNAT
--to-destination 10.40.0.13:25
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 53     -j DNAT
--to-destination 10.40.0.13:53
-A PREROUTING -d 80.80.80.66 -p udp -m udp --dport 53     -j DNAT
--to-destination 10.40.0.13:53
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 20009  -j DNAT
--to-destination 10.40.0.9:22
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 20011  -j DNAT
--to-destination 10.40.0.11:22
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 20012  -j DNAT
--to-destination 10.40.0.12:22
-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 20013  -j DNAT
--to-destination 10.40.0.13:22

#-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 110    -j DNAT
--to-destination 10.40.0.13:110
#-A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 143    -j DNAT
--to-destination 10.40.0.13:143

-A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p tcp -m tcp --sport 53 -j
SNAT --to-source 80.80.80.66:53
-A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p udp -m udp --sport 53 -j
SNAT --to-source 80.80.80.66:53

-A POSTROUTING -o eth0 -j MASQUERADE

-A OUTPUT -d 80.80.80.66 -p tcp -m tcp --dport 53 -j DNAT
--to-destination 10.40.0.13:53
-A OUTPUT -d 80.80.80.66 -p udp -m udp --dport 53 -j DNAT
--to-destination 10.40.0.13:53

Any help would be greatly appreciated.

Gary Wayne Smith

