From: Sander Sneekes <sander@dmdsecure.com>
Subject: Re: Query....  redirecting traffic
Date: 13 Dec 2002 10:47:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039772820.15363.4.camel@sander>
References: <008401c2a286$4cd80ca0$0501a8c0@gndn.subspace.au.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008401c2a286$4cd80ca0$0501a8c0@gndn.subspace.au.com>
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
To: paul.gibson@subspace.net.au
Cc: Netfilter <netfilter@lists.netfilter.org>

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE

iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.1 -j ACCEPT
iptables -A PREROUTING -t nat -p tcp --dport 80 -d 10.10.10.10 -j DNAT
--to 
192.168.1.1:12345

On Fri, 2002-12-13 at 10:02, Paul Gibson wrote:
> Hello,
> 
> 	I am wondering if netfilter can do the following.....
> 
> http connection comes in on 10.10.10.10 port 80, can iptables then redirect
> this to go to 192.168.1.1 port 12345 & also allow the returning data to go
> back the opposite way ???
> 
> We are currently using "redir" to do it and are having some porblems with it
> due to an application we run.
> 
> TIA
> 
> Paul.
-- 
Sander Sneekes
sander@dmdsecure.com

--
Never argue with an idiot. They drag you down to their level, then beat
you with experience.


