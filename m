From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 00:42:50 -0500
Message-ID: <43002B5A.4000909@riverviewtech.net>
References: <200508142133.57867.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508142133.57867.michael@networkstuff.co.nz>
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

I've not run in to or heard of this problem my self before.  But I suspect that there is a support protocol being used that we are aware of.  How knows you may have a few things configured to use the Ident (Auth) protocol to find out the name of the user on the system that is requesting the web pages from.  If this is indeed the case and you do not have a statefull packet inspection allowing returning outbound traffic back in you may be dropping some returning traffic that is sent out from a high port.  In either case I would add the following rules to the end of your list to help diagnose this problem.

iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -j LOG

The second rule is probably the most important as it will log the traffic that is getting dropped and thus you will have an idea what you need to modify your firewall to allow in.



Grant. . . .

Michael Hallager wrote:
> Hello all.
> 
> I have spent rather a lot of time trying to find an answer for this one.
> 
> I have a Slackware Linux box, 2.4.29 kernel running IP Tables. I have the bare 
> number of needed modules compiled into the custom kernel.
> 
> I start IP Tables using the following batch file:
> 
> iptables -P INPUT DROP
> iptables -A INPUT -p tcp --destination-port 22 -j ACCEPT
> iptables -A INPUT -p tcp --destination-port 25 -j ACCEPT
> iptables -A INPUT -p tcp --destination-port 53 -j ACCEPT
> iptables -A INPUT -p udp --destination-port 53 -j ACCEPT
> iptables -A INPUT -p tcp --destination-port 80 -j ACCEPT
> iptables -A INPUT -p tcp --destination-port 110 -j ACCEPT
> iptables -A INPUT -p tcp --destination-port 443 -j ACCEPT
> 
> This works except it makes webpages and email served from this box SLOW to 
> respond. (Several seconds).
> 
> Any ideas please? Questions welcomed.
> 
> Michael Hallager
> networkStuff ltd
> www.networkstuff.co.nz | p.09.839.1000 | m.029.638.7883


