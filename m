From: Jason Opperisano <opie@817west.com>
Subject: Re: IPTABLES HELP
Date: Wed, 15 Dec 2004 18:17:34 -0500
Message-ID: <1103152647.13025.4.camel@hubcap.ljm.dom>
References: <20041215231734.20439410C37@mailroute.thevine.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041215231734.20439410C37@mailroute.thevine.net>
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

On Wed, 2004-12-15 at 18:09, Burton wrote:
> Ok I have had some great help with people on this board I just have not
> found an answer to my problem.
>  
> This is what I need to happen
>  
> [Client]--->T1(12.22.81.1) -->[Linux 12.22.81.8 10025]-->[Windows Mail
> Server 204.250.113.2 25] 
> 
> Then I would like it to also send the data back though T1 (12.22.81.1)
>  
> Current clients get to our SMTP server IE:
> [Client]--->T1(204.250.113.1) -->[Windows Mail Server 204.250.113.2 25]
>  
> 
> The point of this is my boss wants us to divert some traffic though t1
> (12.22.81.1) but keep the our mail server on its current network
>  
> This is what I have tried
>  
> iptables -F
> service iptables stop
>  
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j DNAT --to
> 204.250.113.2:25

try adding:

  iptables -t nat -A POSTROUTING -o eth1 -d 204.250.113.2 --dport 25 \
    -j SNAT --to-source $ip_of_eth1

to force the replies from the windows mail server back through the linux
box.
 
-j

--
"Here we have an ordinary square.
 Whoa! Slow down egghead!"
	--The Simpsons


