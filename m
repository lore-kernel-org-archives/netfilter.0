From: Vadim Kurland <vadim@vk.crocodile.org>
Subject: Re: inner workings of IP tables
Date: Mon, 30 Sep 2002 10:34:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D988B11.2020107@vk.crocodile.org>
References: <Pine.LNX.4.40.0209300905060.19596-100000@klepto.security.algx.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Kevin Dwyer <Kevin.Dwyer@algx.net>
Cc: netfilter@lists.netfilter.org



Kevin Dwyer wrote:

>>    
>>
>I think you're right, with the exception that the CLI in question here is
>usually a shell (unless someone has built their own thing on top of it --
>I'm only referring to netfilter as it is distributed freely) and usually
>has a text editor available, which gives you the means to adequately
>modify any ruleset without needing a graphical workstation, given you are
>familiar with typical unix commands (which you ought to be if you are
>going to be administering a netfilter firewall).
>  
>

I see. I meant the set of command line options for "iptables", which is 
CLI in this case. Even someone who is very good at shell, vi etc. may 
have no idea about relationship between chains and tables, not to 
mention modules and their parameters. Firewall administrator thinks in 
terms of addresses, packets and protocols, but CLI in this case exposes 
details which are too low-level. This makes learning curve longer, which 
increases the risk.

>So if you do use a GUI like fwbuilder for generating rules, you get the
>advantage of a visibly clear ruleset and damage control when you're
>partying in Hawai'i but the boss calls unexpectedly saying they need a
>special quick fix change implemented.  This is not the case with the CP
>GUI, as experience has shown.  It's the _option_ that I find most
>appealing, I suppose.
>  
>

I do agree very much here. My goal is to find a fine balance between 
high level of abstraction and ease of use of the GUI and maximum control 
that experienced administrators want.

--vk



