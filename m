From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Ping only inside my network
Date: Mon, 20 Dec 2004 09:14:34 +0100
Message-ID: <20041220081414.E0A582F42A@kshira.sterenborg.info>
References: <Pine.LNX.4.05.10412200242010.18976-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412200242010.18976-100000@darkstar.sysinfo.com>
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

netfilter-bounces@lists.netfilter.org wrote:
>>> to be able to make pings inside my network. At the moment i am
>>> trying to ping my linux box from an windows terminal and i get
>>> request timed out.
>> 
>> You don't give much information about what you've done already, but
>> you have probably set the policy for the INPUT chain to DROP so it
>> will drop any packet for which NF has no rule to accept it.
>> In that case you'll have to accept ICMP traffic from your LAN :
>> iptables -A INPUT -i $IF_LAN -s $IP_LAN -p icmp -j ACCEPT
>> 
>> If you have also set policy to DROP for the OUTPUT chain, you'll want
>> to be able to send the reply packets :
>> iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>> 
> 
> Doesnt; this also require a FORWARD rule for other systems
> inside the lan to talk to one another

AFAIK hosts inside the LAN would ping directly to each other, not
through the firewall, so I don't see reason to include such a rule in
the FORWARD chain.

> And might not the OUTPUT rulke include NEW, incase he wants replies
> from the FW tself to be returned? 

If a ping request comes in (state NEW), I suppose the ping-reply would
have state ESTABLISHED which will be accepted with the second rule
above.
He would however require some rule in the OUTPUT chain (if policy set to
DROP) if he wants to be able so make connections *from* the firewall
(state NEW).


Gr,
Rob


