From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: newbie problem
Date: Mon, 17 Feb 2003 03:09:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302170309.16516.netfilter@newkirk.us>
References: <1045467799.20801.22.camel@billybob.back2front.homelinux.org>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045467799.20801.22.camel@billybob.back2front.homelinux.org>
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
To: Chris Barnes <runtimeerror@bigpond.com>, Netfilter <netfilter@lists.netfilter.org>

On Monday 17 February 2003 02:43 am, Chris Barnes wrote:
> hi people i'm new to the list.
>
> anyway, I have a very simple firewall on a web server. I want to deny
> access to everything except the web server (port 80)
>
> i have set the poilcy on all chains to drop and i have added a rule to
> the input chain which says
>
> iptables -A INPUT -p tcp --sport 80 -j ACCEPT

> iptables -A OUTPUT -p tcp -j ACCEPT

> what am i doing wrong or what is a better way to do this?
>
> thanks heaps for your help.

You have to accept connections TO port 80, not FROM port 80...

Try these:

iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

They will allow clients to connect and retrieve http documents, as well=20
as allowing the very useful ICMP controls like source_quench=20
fragmentation control and such that really make web browsing work=20
properly, but no other communication in OR out is allowed by these=20
rules.  (assuming DROP policy on OUTPUT)  Add appropriate ACCEPT rules=20
to OUTPUT if the server needs to initiate connections for some reason.

j


