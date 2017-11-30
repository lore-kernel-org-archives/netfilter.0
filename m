From: Robert White <rwhite@pobox.com>
Subject: Re: SNMP mangling anybody?
Date: Thu, 30 Nov 2017 11:02:32 +0000
Message-ID: <c38d24c0-9425-2b08-6db6-6df1db83261e@pobox.com>
References: <038581F89849074CAFDAFA8E4AE887F41F76D74C@GAALPA1MSGUSRBF.ITServices.sbc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <038581F89849074CAFDAFA8E4AE887F41F76D74C@GAALPA1MSGUSRBF.ITServices.sbc.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "FAIR, ED" <ef7193@att.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

You need to bind the socket to the specific interface using your
application.

For snmpget, for example, you can use the snmp.conf file or just add the
clientaddr option on the command line.

so using:

snmpget --clientaddr=udp:192.168.168.3 (rest of stuff)

would bind the get to the local address, and so interface, you
specified. You seem to already know about this but want to avoid it for
some reason.

You are correct that policy routing does not rewrite packet addresses.
That's not what it's for. Rule based nat can do it, but that's not your
best option.

If you want to rewrite the addres, then SNAT the packet (that's what
snat is for, ha ha ha).

But really, unless you have some reason no to, you should use the most
native tool (the clientaddr option or similar) instead of getting "tricky".

As Scotty famously said "the more you over-think the plumbing, the
easier it is to stop up the pipes."

You can use the mark to limit the snat in postrouting, presuming you're
getting the packets marked properly.


iptables --append POSTROUTING \
  --match mark --mark 256 \
  --jump SNAT --to-source 192.168.168.7

But seriously, clientaddr is your best option.

--Rob

On 11/29/2017 04:27 PM, FAIR, ED wrote:
> Hi,
> 
> Are there any members here successfully mangling SNMP requests/replies (udp 161)?  I'm trying to policy-route my outbound SNMP requests, but my efforts have been unsuccessful to date.  I'd like to hear how you do it.
> 
> I have two interfaces in play; I do not have routing turned on; bond0.1 is used for the default route (main table); I would like to policy-route just the locally-generated SNMP requests via bond0.2 towards a NAT device.  So I use:
> 
> 	ip route add to unicast default table 7 via 192.168.168.7 dev bond0.2 src 192.168.168.3   #192.168.168.7 is a NAT server, 192.168.168.3 is the address assigned to bond0.2
> 	iptables -t mangle -A OUTPUT -p udp --dport 161 -j MARK --set-mark 256
> 	ip rule add priority 9999 type unicast fwmark 256 table 7
> 	ip route flush cache table 7
> 
> In the above configuration, the SNMP requests correctly egress via bond0.2 - the policy-routing is having some effect - but the requests retain the bond0.1 address in the IP SRC - the policy-routing doesn't update the IP SRC as I had hoped.  
> 
> For testing, I'm using net-snmp-utils "snmpget" command, with no "clientaddr" specified.
> 
> Thanks in Advance!
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

