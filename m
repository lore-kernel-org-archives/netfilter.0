From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MAC address and iptables
Date: Sun, 29 Feb 2004 15:12:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291512.36482.Antony@Soft-Solutions.co.uk>
References: <4041ED0A.9070001@stupar.homelinux.net> <4041F1E4.8020408@stupar.homelinux.net> <4041F975.3060701@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4041F975.3060701@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Sunday 29 February 2004 2:38 pm, Sasa Stupar wrote:

> Sasa Stupar pravi:
> > Antony Stone pravi:
> >>
> >> Try something like:
> >>
> >> iptables -A INPUT -s a.b.c.d -m mac --mac aa:bb:cc:dd:ee:ff -j ACCEPT
> >>
> >> Where a.b.c.d is the IP address and aa:bb:cc:dd:ee:ff is the MAC
> >> address of the machine you want to allow access to the firewall system.
> >>
> >> See "man iptables" for more info.

> I have done this command and it doesn't work.

When you say "it doesn't work", do you mean netfilter gives you an error, 
saying there is a problem with the command you entered, or netfilter accepts 
the command, but it doesn't happen to do what you want it to do?

> I have changed the rule to:
>
> iptables -A INPUT -s ! a.b.c.d -m ! mac --mac aa:bb:cc:dd:ee:ff -j  DROP
>
> then it works

This sounds worryingly like you have a default ACCEPT policy on your INPUT 
table.

> BUT as soon as I add another ip and mac address then I am
> blocked out.
>
> What am I doing wrong here?

Tell us the rest of your ruleset - it sounds like you are accepting everything 
on INPUT, except packets which you're blocking, when you should be doing it 
the other way round.

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


