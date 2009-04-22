From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Wed, 22 Apr 2009 09:03:39 -0600
Message-ID: <op.ussmsdrix1lyi3@localhost>
References: <20090418082314.GA12566@internet24.de>
 <op.usld3aqfx1lyi3@localhost> <20090418184809.GA15649@internet24.de>
 <op.uslkl80px1lyi3@localhost> <20090418205802.GA16790@internet24.de>
 <op.uslqwresx1lyi3@localhost> <20090419090016.GA19987@internet24.de>
 <op.usn740lix1lyi3@localhost>
 <1240225752.27336.25.camel@enterprise.ims-firmen.de>
 <op.usoy1zlxx1lyi3@localhost> <20090420192600.GB1158@internet24.de>
 <op.usq1orvex1lyi3@localhost>
 <1240392933.20822.6.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240392933.20822.6.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Wed, 22 Apr 2009 03:35:33 -0600, Thomas Jacob <jacob@internet24.de> wrote:

>>
>> I tightened up the policies and added rules to pass any packets, for new connections or otherwise, to or from eth0 (the LAN), and drop NEW connection packets except those from the local machine and from LAN. :
>>
>> iptables -t filter -P INPUT DROP
>> iptables -t filter -P OUTPUT ACCEPT
>> iptables -t filter -P FORWARD DROP
>>
>> iptables -t mangle -A INPUT -i eth0 -j ACCEPT
>> iptables -t mangle -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables -t mangle -A FORWARD -i eth0 -j ACCEPT
>> iptables -t mangle -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Do you have the ESTABLISHED stuff also in Output? Otherwise you will
> block direct access to that box (see the packet traversal graph
> again)....

I have the OUTPUT policy set to ACCEPT (I want to accept any packets sent by my local box).   According to my understanding, any packet that does not match an OUTPUT rule would therefore be accepted.  It should not be necessary to have any OUTPUT rule, is that right?

My setup is working for LAN-connected machines access only when I set the INPUT policy to ACCEPT, which is too loose for my taste, even though I am behind my ISP's nat/firewall.  Therefore, it seems that the problem must be in my INPUT chain rules.

I got load-balancing for LAN-connected machines (which are natting to both ppp0 or ppp1) working.  I fixed it to configure any single interface (no load-balancing), or both ppp0 and ppp1 for load-balancing, if both interfaces are up.  I put the script in /etc/ppp/ip-up.d and /etc/ppp/ip-down.d, which allows this to auto-configure the interfaces whenever an interface comes up or goes down.  It works very well.

When there is but a single interface up, then, all the load balancing stuff (MARK, CONNTRACK, etc.) is skipped, and the iptables commands become very simple (just a simple firewall with nat for the LAN).   Only the following commands are used when only one interface is up:

src0=`ip route show dev ppp0 2>/dev/null | head -n1 | cut --delimiter=" " --fields=10`
src1=`ip route show dev ppp1 2>/dev/null | head -n1 | cut --delimiter=" " --fields=10`
gw0=`ip route show dev ppp0 2>/dev/null | head -n1 | cut --delimiter=" " --fields=1`
gw1=`ip route show dev ppp1 2>/dev/null | head -n1 | cut --delimiter=" " --fields=1`

# flush all iptables entries
iptables -t filter -F
iptables -t filter -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD DROP

iptables -t mangle -A INPUT -i lo -j ACCEPT
iptables -t mangle -A INPUT -i eth0 -j ACCEPT
iptables -t mangle -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t mangle -A FORWARD -i eth0 -j ACCEPT
iptables -t mangle -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t mangle -A OUTPUT -o eth0 -j ACCEPT
iptables -t mangle -A OUTPUT -o lo -j ACCEPT

if [ "$src0" == "" -o "$src1" == "" ]; then
#	echo a device is not online, setting default gateway and quitting
	ip route del default dev ppp0 2>/dev/null
	ip route del default dev ppp1 2>/dev/null
	if [ "$src0" != "" ]; then
		ip route add default dev ppp0
		iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
	fi
	if [ "$src1" != "" ]; then
		ip route add default dev ppp1
		iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
	fi
	exit
fi


I have studied the iptables flow diagram, it seems to me that my INPUT rules above should allow all traffic to/from a LAN-connected (eth0) machine.  However, I am missing something, since I have to set the INPUT policy to ACCEPT to get connectivity from the LAN.  And I have to set the FORWARD policy to ACCEPT to allow my load-balancing stuff to work!

(When this is all fixed I'll post an article about it on my "Linux Notes" site at http://www.voluntary-simplicity.org/linux.)

