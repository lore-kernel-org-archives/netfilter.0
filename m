From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: port translation
Date: Fri, 16 Jan 2004 17:32:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <bu9oqk$e1j$1@gatekeeper.tmr.com>
References: <4001239D.7010904@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4001239D.7010904@yahoo.fr>
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
To: netfilter@lists.netfilter.org

Romain Moyne wrote:
> Hello,
> 
> I'm French and my english is bad ;)
> 
> I have a http server (debian 3.0) behind a router (debian 3.0). I have a 
> problem when I want to log the visitor's IP of my website with PHP or 
> Perl or all language. I have always the IP of my router ! Somebody tell 
> me that I must do port translation but I have searched and I haven't 
> fand anything.
> Can you help me ?
> This is the rules of my router :
> 
> iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT 
> --to-destination 192.168.0.3:80

Something wrong here... you would see the IP of the router if you were 
doing MASQUERADE, but not with DNAT. I have a similar setup, and my mail 
server filters LOTS of addresses by IP.

You should be sure you don't have a leftover MASQUERADE (or SNAT) rule 
which is being used, then run tcpdump on the internal NIC of the router 
and catch the packets as they leave. DNAT does just what you want, and I 
have a fair number of machines running as routers which don't have this 
problem.

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979

