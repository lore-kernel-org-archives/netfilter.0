From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Firewall setup at boot - trouble with setting up the LOG target
Date: Thu, 3 Jul 2003 09:19:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3554@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Michal Kepien <lordpopcorn@poczta.onet.pl>, netfilter@lists.netfilter.org

Just a blank stab at it, but does syslog have to be started to use the
LOG functionality?

-----Original Message-----
From: Michal Kepien [mailto:lordpopcorn@poczta.onet.pl]=20
Sent: Thursday, July 03, 2003 9:12 AM
To: netfilter@lists.netfilter.org
Subject: Firewall setup at boot - trouble with setting up the LOG target

Hi there, I've got a problem with my boot-time firewall setup script.
It works almost 100% correctly, however there is a little problem.

I'm using iptables v1.2.8 and kernel 2.4.19. Amongst other actions,
the script creates a custom chain called 'drop-and-log' and inserts 2
rules into it:

1. 'iptables -A drop-and-log -j LOG --log-level info'
   (log a packet)
2. 'iptables -A drop-and-log -j REJECT'
   (after logging, reject the packet)

The problem is that when I run the 'iptables -L' command after the
boot is completed, I only see rule no. 2 (REJECTing, without LOGging)
in the 'drop-and-log' chain. When I run the script once again,
manually (by executing '/etc/rc.d/rc.firewall'), after the boot is
completed, everything works fine. The scripts looks like this:

-----START rc.firewall-----
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -F
iptables -X
iptables -Z
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -N drop-and-log
iptables -A drop-and-log -j LOG --log-level info
iptables -A drop-and-log -j REJECT

[...INPUT, OUTPUT and FORWARD rules...]

modprobe ip_nat_ftp
modprobe ip_conntrack_ftp
-----END rc.firewall-----

Probably there's something about the module ipt_LOG here, but I've
tried inserting 'modprobe ipt_LOG' in the beggining, at the end and in
the middle of the script - it did no good.

I'd be grateful for any help in this matter.

Michal Kepien


--=20
Lord Popcorn
lordpopcorn@poczta.onet.pl

"The UPL leaders formulated a bold plan that would assure that humanity
would persevere, unscathed by the tempting corruption of radical
technologies." --- Blizzard Ent.


