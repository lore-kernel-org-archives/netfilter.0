From: "Jean Caron" <caronj@norac.net>
Subject: Re: IPSec through my firewall
Date: Wed, 16 Feb 2005 09:59:36 -0500
Message-ID: <20050216145936.25916.qmail@mail.norac.net>
References: <200502151715.j1FHFtfO029324@pepsi.fishpuppy.com>
	<200502160129.26423.rowdy@com> <4213200C.9060108@hotpop.com>
	<87r7jgwu3x.fsf@helmut.nilsson.homedns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <87r7jgwu3x.fsf@helmut.nilsson.homedns.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Ola Nilsson <ola@fam-nilsson.org>
Cc: netfilter@lists.netfilter.org

Ola Nilsson writes: 

> Georgi Alexandrov <tehlists@hotpop.com> writes: 
> 
>> rowdy wrote:
>>> I added rules like the following (but to user chains that I then
>>> added to the input, output and forward chains) to solve my hassles
>>> (clipped from the freeswan link above):
>>> # allow IPsec
>>>#
>>># IKE negotiations
>>>iptables -I INPUT  -p udp --sport 500 --dport 500 -j ACCEPT
>>>iptables -I OUTPUT -p udp --sport 500 --dport 500 -j ACCEPT
>>># ESP encryption and authentication
>>>iptables -I INPUT  -p 50 -j ACCEPT
>>>iptables -I OUTPUT -p 50 -j ACCEPT 
>>>
> ..snip
>> that's more than pointless as he has INPUT, OUTPUT and FORWARD
>> policies set to ACCEPT and no other rules.
> 
> Even so, I'm thankfull for any suggestions.  
> 
> So, going back to my initial question; How can I go about finding out
> where my packets are droped? Since it's most likelly not because of
> any netfilter rule entry, who else can decide that a packet can not be
> NATed? 
> 
> -- 
> /Ola Nilsson 
> 
> 
Ola, 

Your problem is directly related to NAT. You can not use NAT. ESP will not 
establish any security association if the source or destination address have 
been modified, which is exactly what NAT does to your packets. In order for 
this to work, you need to encapsulate your ESP (IPsec) traffic within either 
UDP or TCP. NAT-Traversal does this. Different vendors implement this using 
different ports.protocol, but essentially they are encapsulating the orignal 
packets, hiding the info from NAT. 

The iptable rules above are exactly what you'd need if the tunnel was 
terminating ON the firewall. But to terminate it PAST the firewall, unless 
you use public addresses everywhere (no NAT), you will need to encapsulate, 
and define approriate (additional) rules on your firewall fot the NAT-T port 
used. 

Hope this helps,
Jean 



