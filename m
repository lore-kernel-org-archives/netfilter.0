From: "Marco Strullato" <batstru@email.it>
Subject: Re: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 18:30:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007d01c46dae$0a45f330$eb53623e@x>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108> <40FC2286.3070005@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

> > -A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport
25 --state
> > NEW -j ACCEPT
>
> And here is the error.
>
> As me (and I believe Antony, possibly others) already told you,
> Netfilter does not know about virtual interfaces.  Virtual interfaces
> are abstractions that exist in higher levels of kernel than Netfilter
> is.  Netfilter is concerned only on which *physical* interface the
> packet is.  Replace "-i eth1:1" with "-i eth1" in above rule (and same
> for all other virtual interfaces you have) and you'll be fine:
>
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 25
> --state NEW -j ACCEPT

I've tried with just eth1 but the rule is not applied, or it seems not to be
applied

I've seen that using virtual interfaes is deprecated so I tryed to set
multilple ip with iproute.
If I set network interfaces only with iproute and not with ifconfig, network
configuration seems to be absent.
If I set network with ifconfig and not with iproute, network configuration
seems ok
So I can't to use iproute (to set interfaces) and iptables becacuse network
configuration is absent.

best regards

marco



=20

=20

 --

 Email.it, the professional e-mail, gratis per te: http://www.email.it/f

=20

 Sponsor:

 Rinfresca la tua estate con i climatizzatori ed i ventilatori

* che trovi disponibili=85 Crios, Orieme, Hokkaido, Argo, Carrier, Vortice

 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2650&d=3D20-7

