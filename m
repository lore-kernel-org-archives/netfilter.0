From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: another quick question
Date: Mon, 20 Sep 2004 06:02:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095674560.1779.96.camel@grendel>
References: <a0f69e50409200102455b0172@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50409200102455b0172@mail.gmail.com>
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

On Mon, 2004-09-20 at 04:02, Askar wrote:
>
> iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A FORWARD -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> 
> aren't there are unnecessary repitions ?

Agreed. The "proper" place for filtering rules is the INPUT and/or
FORWARD chain. You should be able to delete the two PREROUTING rules
without a problem.

> also why he (my
> predecssor) droping such port in INPUT table ? aren't it unnecessary,
> coz it a linux box no port 135:140 are open on our fw machine.

Unless you run SAMBA. ;-)

My guess is it was done to keep the traffic from hitting a later logging
rule, but its hard to say without seeing the entire rule base. It could
also have something to do with the "permit what has not been denied"
policy you mentioned in your last e-mail. Either way, it should not hurt
anything and its a good idea to block outbound NetBIOS/IP if your
organization does not need it to do business. Attackers can use it to
transfer a rootkit onto the system. If the ports are blocked, their
lives become just a little bit harder.

HTH,
Chris



