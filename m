From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: connlimit problem
Date: Wed, 14 Jul 2004 11:00:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407141100.14587.Antony@Soft-Solutions.co.uk>
References: <3470.80.51.249.26.1089797826.squirrel@www.elpec.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3470.80.51.249.26.1089797826.squirrel@www.elpec.com>
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

On Wednesday 14 July 2004 10:37 am, Robert Czechonski wrote:

> Hello
> I have kernel 2.4.25 and iptables 1.2.11. When I typed:
>
> iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 80 -j
> REJECT
>
> The system responded:
>
> iptables v1.2.11: no command specified
> Try `iptables -h' or 'iptables --help' for more information.
>
> Anyone can tell me what did I wrong?

Sure.   You forget to tell iptables where you wanted to place the rule.   You 
have to specify "-I <chain>" or "-A <chain>" where <chain> is one of INPUT, 
OUTPUT or FORWARD.

I would assume you meant to put this rule in your INPUT or FORWARD chains, 
considering what it does.

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


