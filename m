From: =?UTF-8?Q?Jan=2DAage_Frydenb=C3=B8=2DBruvoll?= 
	<jan@frydenbo-bruvoll.com>
Subject: MASQUERADE problems
Date: Sat, 7 Feb 2015 17:30:11 +0000
Message-ID: <CALLYqUmc0pnkkPX6QFKaaRKp1njjgqHuwXRuZkKU7Xz-mUKqhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear List,

We are trying to set up an OpenVPN server with forwarding to a
specific range of IP addresses. Our configuration limits who gets
access to what networks via a combination of OpenVPN user-specific
routing instructions and static iptables rules, both in the FORWARD
chain and in the nat table POSTROUTING chain.

For my own user, for instance, my OpenVPN client would be instructed
to route network 1.2.3.0/24 (obfuscated) via the tunnel, and use PtP
addresses 10.39.1.2 10.39.1.1 for the local and remote end,
respectively.

On the server we'd have this set of rules:

$ iptables -t filter -S FORWARD
-P FORWARD DROP
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s 10.39.1.2/32 -i tun0 -o eth0 -j ACCEPT

$ iptables -t nat -S POSTROUTING
-P POSTROUTING DROP
-A POSTROUTING -s 10.39.1.2/32 -o eth0 -j MASQUERADE

Our problem is this: the MASQUERADE rule only triggers for certain
types of traffic! We have HTTPS, SSH and various other protocols
running just fine, but for some inexplicable reason the MASQUERADE
rule does not trigger on traffic to port 80. The recipient IP does not
seem to matter, and we can see via tcpdump that the packets end up in
the POSTROUTING chain without being rewritten. Correspondingly, we can
see other protocols' packets arrive and leave the chain, correctly
rewritten, and they will then (obviously) turn up on the recipient
side and be replied to.

We have also tried using a correspondingly crafted SNAT rule instead
of the MASQUERADE rule - this exhibits the exact same behaviour.
Everything but port 80 works.

The VPN server is a Gentoo machine with kernel 3.14.14 and iptables
toolkit version 1.4.21-r1, explicitly recompiled against this kernel.

Would the list know of any known bugs, or see any obvious mistakes in
this setup? It's quite frankly driving us a bit mad a the moment - we
cannot see the sense in it.

Your kind assistance will be greatly appreciated.

Best regards
Jan
