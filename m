From: Martijn Lievaart <m@rtij.nl>
Subject: Re: DNAT Question & ULOG Question
Date: Fri, 16 Jun 2006 12:09:45 +0200
Message-ID: <44928369.4060803@rtij.nl>
References: <EB7DBACA-57BF-4FB5-9C71-03AA7D6C2C54@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <EB7DBACA-57BF-4FB5-9C71-03AA7D6C2C54@gmail.com>
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
To: Brett Curtis <dashnu@gmail.com>
Cc: Netfilter Lists <netfilter@lists.netfilter.org>

Brett Curtis wrote:

> A couple questions before I try to push out my new firewall.
>
> Creating a  PREROUTING rule on a DROP all policy like so.


I assume you mean DROP all policy on INPUT, FORWARD and OUTPUT.

>
> $IPT -t nat -A PREROUTING -i $EXTIF -d $HOST_EXTIP -p tcp --dport 22 \
>   -j DNAT --to-destination $HOST_INTIP:22


Fine.

>
> This allows the packets to pass through my external nic so I would  
> only need a forward rule like so to complete the request?
>
> $IPT -A FORWARD  -o $INTIF -d $HOST_INTIP -p tcp --dport 22


Yes.

>
> From what I read the routing decision happens after PREROUTING but I  
> am not sure if the request has traversed pass my external interface  
> at this time.
> Not sure if I need to specify both interface or in my case it would  
> be the same if I specified none.


I'm not sure what you mean, but it is quit simple. The rule is valid. In 
the FORWARD chain, both -i and -o can be used. In this case, it is 
redundand, but it doesn't hurt either.

> My question related to ULOG....  Is ULOG the only way to get iptables  
> logging out of my dmesg ? Every time I type dmesg I find it  
> overloaded with iptables logging.
>

Yes. Although the logging infrastructure is being rewritten for 
x_tables, however, that most probably does not apply to you (you know it 
if it does).

HTH,
M4


