From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: time modules
Date: Sun, 23 Mar 2003 19:21:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303231921.04004.fabrice@netfilter.org>
References: <15911867640.20030318121718@mail.ru>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <15911867640.20030318121718@mail.ru>
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
To: vlad <faktadmin@mail.ru>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


Hi Vladimir,

On Tuesday 18 March 2003 15:17, vlad wrote:
> Hello netfilter,
> iptables -I INPUT 1 -p tcp -s 192.168.1.2/32 -m time --timestart \
> 11:00 --timestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
> -d 192.168.1.1/32 --j DROP
> Defaul policy in INPUT chain - DROP
> But... packets allows to 192.168.1.240 (server) in this
> time --> 11:00-17:00.
> Why?

With a quick guess, two reasons come to mind:
1- you have an ACCEPT rule that shadows the -m time -j DROP rule,
   therefore nullifying its effect.
2- the packets that you talk about still being allowed might be from
   a forwarding connection ? In which case you have to filter in
   forward chain.

To see if 1 is your problem, simply put the rule -m time -j DROP at
the _begining_ of the ruleset, this way you'll be sure it won't be shadowed
by other rules.

To see if 2 is your problem, simply put the rule -m time -j DROP in
the FORWARD chain instead.

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

