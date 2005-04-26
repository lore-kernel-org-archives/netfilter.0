From: Kirk <whereisgui@gmail.com>
Subject: Temporary redirection with DNAT and SNAT
Date: Tue, 26 Apr 2005 10:13:57 -0700
Message-ID: <48be50bb0504261013137f3cd2@mail.gmail.com>
Reply-To: Kirk <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello,

I have to shutdown a proxy server for a few days and I need to
redirect its traffic to a server behind an iptables firewall. Here's
what I want to do:


Original request to $PUBLIC_IP:80 is redirected  to $PRIVATE_IP:2050
(machine behind firewall)

Packets from $PRIVATE_IP:2050 come out of the firewall as coming from
$PUBLIC_IP:80


I binded the proxy's public IP to the firewall's  external interface
(eth0) and added the following rules:

I think I got the first part right.
#test for ezproxy
-A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.3 --dport 2050 -j ACCE=
PT

But I'm having problems with the second part. The SNAT rule:
-I POSTROUTING -s 192.168.0.3 --sport 2050  -o eth0 -j SNAT --to 130.17.174=
.108

#This one seems OK too.
-A PREROUTING -i eth0 -p tcp -d $PUBLIC_IP --dport  80 -j DNAT --to
$PRIVATE_IP:2050


The SNAT rule generates the error:
Applying iptables firewall rules: iptables-restore v1.2.11: Unknown
arg `--sport'

One of the restrictions I have is that *only* the packets from
$PRIVATE_IP:2050 can go out as coming from $PUBLIC_IP:80.

Could someone provide help to solve this problem?

Thanks.
-K

