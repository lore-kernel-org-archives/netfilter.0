From: Unknown <unknown@unknown.invalid>
Subject: Re: OUTPUT ACCEPT, but can't see out
Date: Wed, 3 Mar 2004 20:23:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23806.6199970946$1078363533@news.gmane.org>
References: <40468233.1040702@galleryglobalnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <40468233.1040702@galleryglobalnetworks.com>
Content-Disposition: inline
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

On March 3, 2004 08:11 pm, Kevin Mulcahy wrote:
> Hi All
> I have a very simple set of rules, with default policy for INPUT being
> DROP and  default OUTPUT being ACCEPT.
> However, I can't hit anything on the outside.  I can't ping, ssh - nothing.
> When I flush everything I can see outside no problem.
> My script is:
>
> IPTABLES="/sbin/iptables"
> INTERFACE="eth0"
> SERVER="x.x.x.x"
> SSHA1="y.y.y.y"
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -A INPUT -i $INTERFACE -p tcp -s $SSHA1 -d $SERVER --dport 22
> -j ACCEPT
> $IPTABLES -A INPUT -i $INTERFACE -p tcp -s $ALLIP -d $ALLIP --dport 80
> -j ACCEPT
> $IPTABLES -A INPUT -i $INTERFACE -p tcp -s $ALLIP -d $ALLIP --dport 443
> -j ACCEPT
> $IPTABLES -A INPUT -i $INTERFACE -p ALL -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> #Note - this appears to generate an error
> # iptables: No chain/target/match by that name
> # but would that affect OUTPUT ???
> $IPTABLES -A INPUT -i $INTERFACE -p ALL -j RETURN
>
> $IPTABLES -A OUTPUT -o $INTERFACE -p ALL  -j ACCEPT



	Remove the -p ALL from your established related line.
	dont put one it ...covers all.
	
	in answer to the question you commented in there, YES it will ..your policy on 
	input is DROP -- thus you are getting out, but nothing is getting BACK to you.


	Alistair.
>
>
> Cheers
> Kev.

