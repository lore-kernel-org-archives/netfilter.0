From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: lifecycle of a packet
Date: Fri, 10 Jan 2003 01:33:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1E14D9.3060705@fugmann.dhs.org>
References: <1042152892.3e1dfdbc6f5d1@webmail.enfusion-group.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042152892.3e1dfdbc6f5d1@webmail.enfusion-group.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tony Clayton <tony-netfilter@enfusion-group.com>
Cc: netfilter@lists.netfilter.org

Tony Clayton wrote:
<lots of info on chain traversal>
> 
> This is quite interesting, and not at all what I was expecting based on
> what I'd read.
Depends on what you read :-)
> 
> I have a list of questions about this behaviour, keeping in mind that
> I'm fairly new to iptables/netfilter:
> 
> 1. Why does only the first packet for a TCP/IP connection seem to pass
> through the nat table?  Does connection tracking take over if the packet
> is (ESTABLISHED,RELATED) and work some magic under the covers?
Yes. When you change a packet in the nat table, all following packets 
are nat'ed automatically. This way you do not have to worry about 
natting replys etc.
> 
> 2. Why do both OUTPUT and POSTROUTING chains get traversed for packets
> that the firewall sends out?  Is this useful at all?
Yes. in POSTROUTING you may not know if the pakcet has been generated 
locally or not. However in the mangle-output chain you do. Another usage 
that cannot be done in postrouting is alterations to the packet before 
it hits the filter-output chain. The can e.g be used un conjunktion with 
packet marking:
	iptables -t mangle -a OUTPUT -j MARK --set-mark 0x01
	iptables -t filter -a OUTPUT -m mark --mark 0x01 -j ACCEPT.

(Ok - this example is very simple, but still - its imposible without the 
mangle-output chain)

> 
> 3. Most of the documents I looked at were fairly old.  Is there a
> somewhat recent document that perhaps might benefit from including these
>  tests?
Yes. Take a look at Oskar Andreasson's excellent tutorial at:
http://people.unix-fu.org/andreasson/iptables-tutorial/iptables-tutorial.html
Esp. look at the section named: "Traversing of tables and chains"

Hope it helps.
Anders Fugmann

--
Author of FIAIF
FIAIF is an intelligent firewall
http://fiaif.fugmann.dhs.org



