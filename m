From: "Simon Oliver" <simon.oliver@umist.ac.uk>
Subject: Opening ports for NFS (sanity check for newbie)
Date: Wed, 4 Aug 2004 16:39:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004401c47a39$367cce50$a06e5882@bi.umist.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I'm an iptables newbie (I'm reading all the docs and man pages at the
moment).

I'm using RHEL3 with a simple firewall configuration:

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [12:1048]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT=20
-A FORWARD -j RH-Firewall-1-INPUT=20
-A RH-Firewall-1-INPUT -i lo -j ACCEPT=20
-A RH-Firewall-1-INPUT -p icmp -m icmp --icmp-type 255 -j ACCEPT=20
-A RH-Firewall-1-INPUT -p esp -j ACCEPT=20
-A RH-Firewall-1-INPUT -p ah -j ACCEPT=20
-A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j
ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j
ACCEPT=20
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited=20
COMMIT

It is my understanding that this configuration permits the following =
(please
correct me where wrong):

all outbound traffic
all inbound traffic on loopback device
all inbound icmp type traffic
ipv6-crypt and ipv6-auth header type inbound traffic
new inbound connections for http and ssh traffic
all inbound traffic if connection ESTABLISHED above
any other inbound traffic is rejected

I want to modify the rules to allow NFS exports.  I have the relevant
services running on assigned ports (rather than random portmap ports).
Here's the list of services/ports for both tcp and udp:

sunrpc      111 (portmap)
nfsd        2049
statd       4001
lockd       4002
mountd      4003
rquotad     4004

I'm told that for NFS to work I need to allow fragments too.

First, I inserted the following to turn on logging:

iptables -I RH-Firewall-1-INPUT 8 -j LOG

Then I added the following rules:

iptables -I INPUT -f -j ACCEPT
iptables -I RH-Firewall-1-INPUT 8 -m state --state NEW -m tcp -p tcp =
--dport
4001:4004  -j ACCEPT=20
iptables -I RH-Firewall-1-INPUT 8 -m state --state NEW -m tcp -p tcp =
--dport
2049  -j ACCEPT=20
iptables -I RH-Firewall-1-INPUT 8 -m state --state NEW -m tcp -p tcp =
--dport
111  -j ACCEPT=20
iptables -I RH-Firewall-1-INPUT 8 -m state --state NEW -m udp -p udp =
--dport
4001:4004  -j ACCEPT=20
iptables -I RH-Firewall-1-INPUT 8 -m state --state NEW -m udp -p udp =
--dport
2049  -j ACCEPT=20
iptables -I RH-Firewall-1-INPUT 8 -m state --state NEW -m udp -p udp =
--dport
111  -j ACCEPT

This results in:

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [537:61336]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -f -j ACCEPT=20
-A INPUT -j RH-Firewall-1-INPUT=20
-A FORWARD -j RH-Firewall-1-INPUT=20
-A RH-Firewall-1-INPUT -i lo -j ACCEPT=20
-A RH-Firewall-1-INPUT -p icmp -m icmp --icmp-type 255 -j ACCEPT=20
-A RH-Firewall-1-INPUT -p esp -j ACCEPT=20
-A RH-Firewall-1-INPUT -p ah -j ACCEPT=20
-A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j
ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j
ACCEPT=20
-A RH-Firewall-1-INPUT -p udp -m state --state NEW -m udp --dport 111 -j
ACCEPT=20
-A RH-Firewall-1-INPUT -p udp -m state --state NEW -m udp --dport 2049 =
-j
ACCEPT=20
-A RH-Firewall-1-INPUT -p udp -m state --state NEW -m udp --dport =
4001:4004
-j ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 111 -j
ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 2049 =
-j
ACCEPT=20
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport =
4001:4004
-j ACCEPT=20
-A RH-Firewall-1-INPUT -j LOG=20
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited=20
COMMIT
Does this make sense?

Anyway, it seems to work :-)

Regards

--=20
  Simon Oliver


