From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Redirecting traffic from a non-existent IP
Date: Mon, 5 Jun 2006 13:34:36 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C76@knowledge.wizdom.nu>
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
To: Julian Hagenauer <chaosbringer@gmx.de>, netfilter@lists.netfilter.org

Hmmm, this reminds me of a Dukes of Hazard quote:
Why do something simple, if you can do it the hard way.....


Why not add 192.168.1.5 as secondary IP to your machine?


Otherwise, you are probably acking a static published ARP for
192.168.1.5

-Sietse

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Julian
Hagenauer
Sent: Monday, June 05, 2006 1:28 PM
To: netfilter@lists.netfilter.org
Subject: Redirecting traffic from a non-existent IP=20

Hi,
i am running Linux 2.6.11.12-xen0 (binary distribution).
I want to route all Traffic destined to 192.168.1.5 to 192.168.1.3.
192.168.1.5 is a non-existent IP/host, 192.168.1.3 is a Xen-VM running=20
on localhost, so 192.168.1.5 should act as a kind of alias for=20
192.168.1.3 and be accessible from localhost.
The following modules are loaded:

Module                  Size  Used by
iptable_filter          2432  0=20
iptable_nat            19932  1=20
ip_conntrack           38712  1 iptable_nat
ip_tables              20352  2 iptable_filter,iptable_nat
intel_agp              20124  1=20
agpgart                28968  1 intel_agp


I wrote and ran the following script on localhost:

#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
MAP_FROM=3D192.168.1.5 # virtuelle IP
MAP_TO=3D192.168.1.3 # IP einer VM
iptables -t nat -F
echo "Mappe $MAP_FROM nach $MAP_TO..."
iptables -t nat -A PREROUTING -d $MAP_FROM -j DNAT --to $MAP_TO
echo "Aktuelle Nat-Regeln:"
iptables -t nat -L

But ping 192.168.1.5 or ssh 192.168.1.5 still does not work.
I have no clue what's wrong.

Sincerely,
Julian



