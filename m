From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: Re: state table not working
Date: Mon, 21 Jun 2004 09:47:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087829254.5643.5.camel@hawk.wittenberg.org>
References: <Pine.LNX.4.33.0406211559370.31871-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406211559370.31871-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

> That's strange then: the traffic dump you posted contained the client
> SYN request but did not show the SYN/ACK reply from the server at all.
> 
> What does it mean 'drop iptables/restart firewall'? Delete all rules,
> remove all modules including ip_conntrack and restart?
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary

Exactly.  I tried removing every ipt and iptables-related modules, and
then re-running the iptables script and then everything is good again -
very odd.

I normally use netstat-nat to give a quick human-readable view of what's
in the conntrack table, is there any other tools that are
better/easier?  Is there any debug/tracing that I can do at the
netfilter level to see how these packets are being processed?  I know I
can use iptables and log it that way, but that doesn't seem to be
catching what's really going on.

The unfortunately part is this usually takes days for this to start
manifesting itself again, so hopefully sometime this week I can get for
trace data.

Thanks again,
Dan


