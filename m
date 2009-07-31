From: Andrew Clayton <andrew@digital-domain.net>
Subject: Local to Local via firewall
Date: Fri, 31 Jul 2009 14:42:47 +0100
Message-ID: <20090731144247.01a4f9bb@zeus.int.pccl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Starting to bang my head against the proverbial wall ;)

The set up is relatively simple.

Internet <----> Firewall <----> Office.

The office network is on a 192.168.1.x range. And outgoing traffic is
SNAT'd.

The firewall is set as the default gateway for all office machines.

We also have internet routeable IP addresses, that allow us to access
various machines in the office from outside with rules like (names
changed to protect the innocent)

$IPTABLES -t nat -A PREROUTING -s $SOME_EXTERNAL_HOST -p tcp -d $HOST_E
 --dport 22 -j DNAT --to-destination $HOST_I

$HOST_E is the internet routeable IP address, this IP is configured on the firewall.
$HOST_I is the 192.168.1,x address that we use to access the machine by in the office.

So we have host.foo.co.uk ($HOST_E) when accessing it from outside the office and host.foo.bar 
($HOST_I) when accessing it from inside the office and doesn't go via the firewall.

This works OK. But it would be much nicer if we could just use host.foo.co.uk 
all the time. 

Without adding any extra rules, an ssh to host.foo.co.uk naturally just lands on the 
firewall. What I've been trying to do is add a rule that will allow an ssh to host.foo.co.uk
(which resolves to its internet IP address) but make the connection go to its internal IP
address.

I've tried many different things, with one of two usual outcomes.

1) The ssh just goes to the firewall
2) No ssh connection is made and I get the following logged.

IN=eth1 OUT=eth1 SRC=192.168.1.20 DST=192.168.1.128 LEN=60 
TOS=0x00 PREC=0x00 TTL=63 ID=53892 DF PROTO=TCP SPT=39355 
DPT=22 WINDOW=5840 RES=0x00 CWR ECE SYN URGP=0 

192.168.1.20 is my workstation and 192.168.1.128 is the internal IP
of the machine I'm trying to ssh to as host.foo.co.uk (that I can ssh 
in on host.foo.bar).
 
The rule that does 2 from above is

$IPTABLES -t nat -A PREROUTING -s 192.168.0.0/16 -p tcp -d $HOST_E --dport 22 -j 
DNAT --to-destination $HOST_I

Which is basically the same as our other DNAT rules for accessing
internal machines from outside the office. Which is probably not right
seeing as it's coming from the internal network in the first place.

I can't help but think I'm missing something simple. Then again does
what I'm trying to do make sense?

This is on a stock CentOS 5.3 with iptables v1.3.5

Any insights would be greatly appreciated.


Cheers,
Andrew
