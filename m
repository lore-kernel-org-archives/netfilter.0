From: Peter Johnson <peter@thejohnsons.com.au>
Subject: Re: DNS
Date: 14 Jan 2003 09:21:16 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042496478.611.16.camel@wizardslair>
References: <3E22A883.103@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E22A883.103@mattiamartinello.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am experiencing a similar sort of thing, I am using the 2.4.20 kernel.

I put logging everywhere and also tcpdumped my interfaces and what I
found was that as soon at the PREROUTING DNAT rule was reached the
packet disappeared. It was not forwarded and certainly didn't reach the
internal server.

My rules are (I am trying HTTP, "dot" is my public interface)

$IPTABLES -t nat -A PREROUTING -i dot -p tcp --dport 80 -j DNAT --to
192.168.1.1:80

and

$IPTABLES -t filter -A FORWARD -i dot -o eth1 -p tcp --dport 80 -j
ACCEPT

I look forward to hearing any advice to further debug this situation or
if the solution is obvious then please let me (us) know.

btw. I am forwarding local traffic out successfully.


Regards,

Peter Johnson

On Mon, 2003-01-13 at 22:52, Mattia Martinello wrote:
> Hi all
> 
> I wish to open DNS connections and redirect it from the gateway and the 
> server on the DMZ.
> I tried these rules:
> 
> iptables -t nat -A PREROUTING -p tcp -i ppp0 -d [public IP] --dport 53 
> -j DNAT --to [private IP]:53
> iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j ACCEPT
> 
> iptables -t nat -A PREROUTING -p udp -i ppp0 -d [public IP] --dport 53 
> -j DNAT --to [private IP]:53
> iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j ACCEPT
> 
> But if I try to query my DNS server from the Internet my query goes in 
> timeout.
> The connections between [private IP] and the Internet are allowed (all 
> other services work good without any problem, the only service that gets 
> me some problems is DNS).
> 
> What have I to open to allow DNS connections from the gateway and the DMZ?
> 
> Thank you very much
> Bye
> Mattia
> 
> 
-- 

Give a man a fish and you feed him for a day. Teach him to use the Net
and he won't bother you for weeks.



