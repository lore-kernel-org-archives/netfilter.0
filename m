From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Re: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 17:11:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41339801.2040200@smxy.org>
References: <D5C9032B2B09C64EA2409D6214E91AC9051307@asimail2.alphanumeric.com>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051307@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

(btw, none of your responses wrap at all, and I have to edit them)

>>First, I've never done one-to-one NAT, but I'm sure I can look that up.
> 
> ok.  the basic premise is that you generate pairs of SNAT and DNAT rules 
 > for each private/public IP pair.

Alright.

>>Second, will I require any special rules to allow internal LAN hosts to
>>access the DMZ systems by their public IP addresses? I want to be sure
>>internal systems access them the same way as external systems. Third,
> 
> 
> by their public IP addresses?  yes.  by their names--no (two words for
 > you:  split dns--know it, use it, love it)

I need internal hosts, and external hosts, to be able to connect to the 
DMZ servers by their public DNS names. Connecting to 
http://www.somedomain.com from either the inside or the outside, should 
get you to the server in the DMZ. For testing purposes, we need to 
access everything the same way as our customers.

Not knowing what split-dns was, I googled it. If I understand it 
correctly it seems that this is only needed when you use a single, 
common domain for both internal and external systems. All our external 
systems (both between the firewall and the router, and in the DMZ) are 
in "domain.com" and all our internal systems are in "sub.domain.com", so 
we don't need split-dns, right?

> if you need the internal folks to access the DMZ hosts by public IP,
 > your best bet is probably to do DNATs like:
> 
>   iptables -t nat -A PREROUTING -i $INTERNAL_IF -o $DMZ_IF \
>     -d $DMZ_PUB_IP -j DNAT --to-detination $DMZ_PRIV_IP
> 
> for each host...you can cycle through these in the script that creates
 > the static one-to-one mappings from #1 above...  ;-)

I think I need to look closer at how packets travers netfilter, before 
I'll understand that one. It's been a long day. :)

>>when I write rules for what access is allowed to what systems in the DMZ
>>from either the Internet or the LANs, what do I write the rule against:
>>the real, public IP of the DMZ server, or it's private IP address?
> 
> private IP.  DNAT happens in the PREROUTING chain of the nat table; which
 > is prior to any chain of the filter table.  SNAT happens in the 
POSTROUTING
 > chain of the nat table; which is after any chain of the filter table.  so
 > the rule in the filter table should always (hmmm...) use the actual IP
 > assigned to the NIC of the host in question.

Hmm. Ok.

	-ste


