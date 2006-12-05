From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How make virtual interfaces ( subinterfaces ) on linux machine
Date: Tue, 05 Dec 2006 14:13:13 -0600
Message-ID: <4575D2D9.4020308@riverviewtech.net>
References: <428559.74702.qm@web56206.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428559.74702.qm@web56206.mail.re3.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Elvir Kuric wrote:
> I want to know is there some manual or even better
> book how to make virtual interfaces  ( subinterfaces )
> on linux machine and attach VLANs which are
> implemented on switch to these virtaul interfaces.

I'm not quite sure exactly what you mean by virtual interfaces.

Presently, you can easily create virtual / logical interfaces for any given 
VLAN for a physical interface.  Do some reading on vconfig if you want / 
need more information.  Or, reply and I'll be happy to help.

You could do something as crazy as this, which I have successfully done before.

ifconfig eth0 0.0.0.0 up
ifconfig eth1 0.0.0.0 up

ifenslave bond0 eth0 eth1

vconfig add bond0 1
vconfig add bond0 2

ifconfig bond0.1 1.0.0.1 netmask 255.0.0.0 up
ifconfig bond0.1:1 1.255.255.254 netmask 255.0.0.0 up

ifconfig bond0.2 2.0.0.1 netmask 255.0.0.0 up
ifconfig bond0.2 2.0.0.1 netmask 255.0.0.0 up

brctl addbr bri0
brctl addif bri0 bond0.1
brctl addif bri0 bond0.2

ifconfig bri0 3.0.0.1 netmask 255.0.0.0 up
ifconfig bri0:1 3.255.255.254 netmask 255.0.0.0 up


Then use IPTables / EBTables / ARPTables to your heart's content. If you 
enable layer 3 matching on layer 2 for ebtables, you can use IPTables to 
filter bridged traffic.

In the above scenario, you end up with the following interfaces:

eth0
eth1
bond0
bond0.1
bond0.1:1
bond0.2
bond0.2:1
bri0
bri0:1

I hope that helps.  If you have any other questions, fire away.  Sorry, I'm 
not sure of any concise manual, per say, but there are a few man pages for 
each command that you can use in conjunction with other commands.  :)



Grant. . . .

P.S.  Router-On-A-(Bonded and / or VLAN)-Stick is fun and can be very 
useful.  :}  When you start combining a layer 2 managed switch with a Linux 
box things get VERY interesting.  Can you say load sharing across 8 cable 
modems on a router with 2 NICs...

