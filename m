From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: udp port 1025
Date: Mon, 20 Sep 2004 05:56:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095674173.1779.88.camel@grendel>
References: <a0f69e5040920004411e0eeb6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040920004411e0eeb6@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Askar <askarali@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2004-09-20 at 03:44, Askar wrote:
>
> iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
> iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
> iptables -A OUTPUT -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
> 
> when I do "tail -f /var/log/messages", I found lot of below messages
> 
> what mean by all this, can someone care to explain/clear things to me? :)
> may I remove the above iptables rules?

Trying to stop pop-up ads maybe? Windows grabs one of more ports between
1025-1029 and holds them open for RPC functions. The result is spammers
can use them to send pop-up ads to the client. There have also been some
Windows based viruses that propagate on 1025 so the previous admin may
have used -s 0/0 because internal system were becoming infected and
going after hosts on the Internet.

What's kind of odd to me is that the logs you posted are for named and
the above rules limit TCP. Named usually uses UDP for queries which
leaves two possibilities:

1) You have a FORWARD rule someplace else that limits UDP/1025
2) These were queries with large answers (>512 bytes packet size), thus
TCP was invoked. 

So its safe to remove this restriction outbound provided your internal
systems are not infected. I would leave this restriction in place for
inbound traffic and just let in replies statefully. 

HTH,
Chris



