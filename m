From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Static/Dynamic NAT Combination
Date: Fri, 28 May 2004 21:27:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405282127.42236.Antony@Soft-Solutions.co.uk>
References: <20040528175829.7b5a6da6.leslie.polzer@gmx.net> <40B79B3E.2050504@nicaraguarealestate.com> <20040528221802.47e2957c.leslie.polzer@gmx.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040528221802.47e2957c.leslie.polzer@gmx.net>
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

On Friday 28 May 2004 9:18 pm, Patrick Leslie Polzer wrote:

> On Fri, 28 May 2004 14:04:14 -0600
>
> Jorge Davila <isaac@nicaraguarealestate.com> wrote:
> > What do you want to do?
>
> Masquerade Box A with flexible port numbers via the router's PPP connection
> and the same thing for box B with static port numbers.
>
> Based on the docs I am not sure whether this is possible with Netfilter.
>
> I hope I am able to express this quite complicated thing in a way that
> you can understand it...

I'm not sure I understand, certainly.

What do the port numbers matter?   When doing static or dynamic NAT, it's 
usually the IP addresses that people are bothered about.

I suggest either:

1. Give us a specific example of what you want to happen, showing us the 
source & destination addresses & port numbers for machines A & B, so we can 
see exactly what you want to do, or

2. Show us what wouldn't work using a standard 1-1 NAT ruleset, or a standard 
"masquerade everything behind one IP" ruleset

Regards,

Antony.

-- 

I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


