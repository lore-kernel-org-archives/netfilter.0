From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Dual WAN set-up
Date: Thu, 12 Jan 2012 17:08:08 -0600
Message-ID: <op.v7zujutux1lyi3@debiandesk2.net>
References: <201201121651.18887.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201201121651.18887.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 12 Jan 2012 15:51:18 -0600, Dimitri Yioulos <dyioulos@onpointfc.com> wrote:

> I currently have an iptables/Netfilter firewall router configured
> thusly:
>                               WAN
>                                   |
>  (192.168.x.x) LAN --  fw -- DMZ (10.x.x.x)
> OK, pretty basic.  And, it has worked well for a long time.
> Now, I need to add a second WAN (provided by a second provider).
> I need it to serve specific boxes in the DMZ, both inbound and
> outbound.  Currently, all boxes in the DMZ are served by the
> single WAN connection.  I'm not sure what other information I
> need to provide you, but I'm hoping you all can help with very
> specific instructions or a very detailed how-to so I can get this
> accomplished.  And, of course, I need to get this done yesterday.

Hi,

I am not highly experienced compared to most other posters here, but I'll try to help :)

Shouldn't your diagram indicate that the fw is connected to the WAN (not to the DMZ)?  I will proceed under that assumption.  If you have a netfilters firewall installed, I think all interfaces would go "through" it.


Adding a second (or more) uplink to a netfilters firewall is easy.  I suggest the following:

1. You could follow the basic information explained here, to set up split access: http://lartc.org/howto/lartc.rpdb.multiple-links.html  After reading this and understanding about using multiple routing tables to route traffic through different interfaces (uplinks), you can proceed.

2. You would set up a custom routing table for the special DMZ traffic.  Use the info in the above link to do that.  Suppose it is called "DMZSPECIAL".  You will set up routing to the new DMZ interface using the MYDMZ table, something like this:

	ip route add 10.x.x.x/8 dev ${DMZinterface} src ${wan} table DMZSPECIAL
	ip route add default via ${gateway} dev ${interface} table DMZSPECIAL

(You will also keep your regular routing table to your old interface.  Also of course you keep your SNAT over your existing interface, only for LAN hosts of course.)

2. You might create a custom chain for the new interface, which is supposed to serve the special DMZ hosts.  This is to mark packets for subsequent decision on routing:

	iptables -t mangle -N CONNMARK1
	iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
	iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark
	iptables -t mangle -A CONNMARK1 -j ACCEPT

3. You would NEW mark all packets from the special DMZ hosts with fwmark 1, like this (repeat for each source IP or subnet to use the new interface):

	iptables -t mangle -A PREROUTING -m state --state NEW -s 10.x.x.x -j CONNMARK1
	etc.


4. You would restore the connection mark to the packet mark with a rule like this:
	iptables -t mangle -A PREROUTING -i ${dmz_if} -m state --state ESTABLISHED,RELATED -j CONNMARK --restore-mark

Then add a policy routing rule, directing all traffic with the "1" mark to the new DMZ uplink:

	ip rule add fwmark 1 table MYDMZ

That should do it.  Post back if you have any trouble.
-- 
Lloyd
