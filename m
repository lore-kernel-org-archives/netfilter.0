From: "P.Italiaander" <pc-secure@home.nl>
Subject: Re: iptables multiple clients internal network warcraft3
Date: Mon, 12 May 2003 01:06:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305120106.53047.pc-secure@home.nl>
References: <000001c317c0$a94de540$0200a8c0@knighthawk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c317c0$a94de540$0200a8c0@knighthawk>
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

Op zondag 11 mei 2003 15:24, schreef Thomas Stian Bergheim:
> Hi!
>
> I'm playing warcraft behind a firewall (iptables) which runs on redhat8.
>
> It works fine for me, but other clients on my internal network
> (192.168.0.x) can't join me.
> I guess this is because the packets they reply with have a different
> source adress. So the solution should be fairly simple using iptables..
> But I've tried many things, with no luck...
>
> My server has two eths, one for the dsl connection, the other one for
> the local network.
>
> Anyone got a working setup with this or anything?
>
> Thanks,

The clue is, use Nat

It's possible ,I did it with Counterstrike 3 games at the same time was max.
You have to use Nat or Masquerading .
The limit of 3 was because the Counterstrike server won't let me connect
with more then 3 games, since we use  Nat or Masq, the game-server sees
3 connections from the same IP number. loading game 4 was denied.

The firewall/router himself knows how to deal with the different IP's.

- make sure you authorize tcp/udp ports above 1024: outbound

I don't have specific rules for you , I have @home broadband , but this
is what your looking for.

Pascal

