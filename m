From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 15:58:57 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905201539300.10018@blackhole.kfki.hu>
References: <545248.94047.qm@web44810.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <545248.94047.qm@web44810.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel Ghobangieno <mikeeusa@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wed, 20 May 2009, Miguel Ghobangieno wrote:

> I can't get DHCP to work through the firewall, I've tried everything, even:
> ebtables -A FORWARD -p IPv4 --ip-sport 67:68 -j ACCEPT
> ebtables -A FORWARD -p IPv4 --ip-dport 67:68 -j ACCEPT

You deduced that you have to use numbers and not names. Why don't you 
follow that? Probably you need

ebtables -A FORWARD -p 0x800 --ip-proto udp --ip-sport 67:68 -j ACCEPT

But it's really strange and suspicious that names do not work,
something is really broken on your system. Have you got a correct  
/etc/ethertypes file? Does you run the ebtables commands in chroot?
 
> Other things I tried:
> ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-src 192.168.0.1 --ip-proto udp --ip-sport 67:68 -j ACCEPT
> ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-dst 255.255.255.255/255.255.255.255 --ip-proto udp --ip-dport 67:68 -j ACCEPT

Could you draw the topology of your network? For example, if your firewall 
is the dhcp server, then the chains are definitely wrong above. Or maybe 
the interfaces are mixed up.

Why don't you log the packets??
 
> and before that:
> ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.1 --ip-proto udp --ip-sport 68 -j ACCEPT
> ebtables -A FORWARD -p 0x800 --ip-dst 192.168.0.1 --ip-proto udp --ip-dport 67 -j ACCEPT

These rules makes no sense to me.

> Kernel (newest stable w/grsecurity patch):
> 
> 2.6.29.3-grsec

If you have got grsecurity enabled and the dhcp server runs on the 
firewall, then grsec must be tuned too.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
