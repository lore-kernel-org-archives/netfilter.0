From: "Iptables" <Iptables@InterCept.Net>
Subject: RE: Iptables vs. Cisco PIX
Date: Mon, 11 Apr 2005 09:41:07 -0400
Message-ID: <3BEC0FC090F538409A0736B2D37DA0ED0246F656@icptex02.corp.icpt.net>
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

Both (all) firewalls have their ups and downs... as an enterprise user,
I have used check point, Cisco PIX and IPTables. The biggest difference
in all of them is learning curve, and a few features. Each firewall
works differently in everyones environment (to a point), which basically
means, eval the firewall and see how it performs in your environment. I
run 22 IPTable firewalls on Fedora Core 2 across 22 of my 35 remote
sites, and the rest are scheduled to have one installed by July. My
sites run from T1's to a Full 45mb DS3 with 24/7 connections that
includes customers and support personnel. All of my sites except for the
1 DS3, run on Dell poweredge 700 servers ranging from P4 2.4Ghz - P4
2.8Ghz and all with 512mb memory and 4 Nics and small 40-80gb hd's. The
1 DS3's is connect to 2 Dell Dual Xeon 2.8ghz cpu poweredge 2650 with
1ghz memory. All of my firewalls IPtables configures are configured
manually by a file. I could not find a management console that would do
advanced IPTables configuration and/or use the POM/POM-NG features. Most
were just vanilla program that did basic NAT and packet filtering. I
also run multiple Cisco PIX around my enterprise for different purposes
(some for ISP connections, others to block and dmz customer connections,
and some to protect sensitive systems). Most are PIX 515's and a couple
of 525's. I have not seen any significant performance difference in
either system. The PIX has mgmt consoles, but I use the command line to
configure mine, which is pretty simple.

The only real difference is configuration, troubleshooting connectivity
problems, maintenance, and High availability. You have to take
everything into consideration when considering which firewall to deploy.
The cost of running a Pix versus running Linux on a dell or custom
server is higher, especially if you want high availability (10-15k),
then you have to think of maintenance costs.=20

There are no "best" just firewalls with different feature sets for
different environments. To help, at my last company, we migrated from 2
Cisco PIX HA to 2 HA Check Points on Nokia IPSO (NG FP2). We saw no
difference in performance, but a great improvement in rule management
and easy configuration. But upgrades from 4.1 to NG sucked as well as
initial configuration and setup of all systems (mgmt server and 2
nokias). All these were just firewalls with no VPN connections, because
there we had 2 cisco concentrators.=20
=20
I would choose a Linux system with IPTables, before choosing a PIX or
Check point solution. I can run things like NTOP, packet sniff with
ethereal, run Snort and so much more... I like PIX and I like Check
Point and they will continue to be recommended firewalls from me for the
respected environment and cost benefit.

I am in the middle of implementing HA to my 2 Firewalls here that are
connected to the DS3 on 2 Dell 2650s. I was at first using a shell
script I made to ping the interface and "do" based on the responses. I
am now getting ready to convert them over to VRRP and provide HA that
way. Next after that is to get Zebra installed and provide some extra
routing capabilities (BGP).

http://www.imagestream.com/VRRP.html

http://sourceforge.net/projects/vrrpd/

http://www.zebra.org/


Thanks,
Michael Brown, CISSP-ISSMP, ISSAP
Sr. Security Analyst
Fidelity IFS Security Operations

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Alejandro
Cabrera Obed
Posted At: Friday, April 08, 2005 11:06 AM
Posted To: Iptables
Conversation: Iptables vs. Cisco PIX
Subject: Iptables vs. Cisco PIX

Hi people !!!

This time I want to know your opinion about iptables vs. Cisco
PIX....where
would you use each of them ????
Is it the same using iptables or PIX in big corporations with heavy
Internet
traffic ???? Which is considered the "best" and why ???

I use iptables since a long time, but my network is under 50
workstations.

Thanks for your comments, they're welcome.

At last, I suggest the tutorial from Jose Negreira at
www.iptableslinux.com,
it's really good for persons who start into iptables world.

Thnking in advance,

Alejandro






