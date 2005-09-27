From: David Leangen <dleangen@canada.com>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Tue, 27 Sep 2005 09:17:52 +0900
Message-ID: <43388FB0.2060307@canada.com>
References: <4337A526.3@canada.com>
	<51347.193.173.147.3.1127721085.squirrel@193.173.147.3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51347.193.173.147.3.1127721085.squirrel@193.173.147.3>
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


Thank for for the quick reply! (For some reason, I didn't hit "send" 
yesterday...)

>>-A PREROUTING -s 192.168.0.0/16 -d 192.168.1.1 -j ACCEPT

> IMO only if there's no rule on top of this one that does 
 > NAT. Is there ? In that case this rule will never be reached.

Nope. It's the first rule in the NAT table.

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -s 192.168.0.0/255.255.0.0 -d 192.168.1.1 -j ACCEPT
-A PREROUTING -p tcp --dport 443 -j DNAT --to 192.168.2.2:443
etc...


> What do the byte counters for this rule say when you execute :
> iptables -nvL PREROUTING

Hmmm... weird...

[root@sannomiya ~]# iptables -nvL PREROUTING
iptables: Table does not exist (do you need to insmod?)



>>BTW, I'm not sure why I can communicate with the 192.168.2 
 >>subnet, but not my 192.168.1 subnet... Only the machine directly
 >>connected to 192.168.1.1 is able to communicate with it...

> Did you tcpdump anything to see what's going on ?
> Not having your complete routing table and ruleset it's hard to tell if
> everything is setup correctly.

I tried that. Apparently, the packets get routed to 192.168.2.1 as 
expected, so they must be getting eaten up by my iptables... I'll take 
another look to try to figure out why.


