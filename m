From: Dmitry Labutcky <avl@strace.net>
Subject: Re: DF reset / MSS clamp pmtu
Date: Tue, 27 Jul 2004 09:09:17 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407270909.18426.avl@strace.net>
References: <000001c47314$908a0100$0a00020a@burmann.local.tld>
Reply-To: avl@strace.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c47314$908a0100$0a00020a@burmann.local.tld>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org
Cc: Holger Burmann <H.Burmann@gmx.de>

Hello,
> Hello !
> Windows 2000 Server drop icmp messages "fragmentation needed". I can
> only get stupid answers from Microsoft about routers who drop the packe=
s
> - but the problem is Microsoft.
>
> So I add
>
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
> --clamp-mss-to-pmtu
>
> To my Linux router. It works fine for outgoing traffic but not on
> incomming.
>
> Example:
>  1) Windows Client --- mss 1460 -> Linux box ---ppp mss 1452 --->
>  2) Windows Client <-- mss 1460 -- Linux box <--ppp mss 1460 ---
>  3) Windows Client -- 1500 Bytes --> Linux box
>  4) Windows Client <-- icmp max 1492 Bytes -- Linux box
>  5) Windows Client -- 1500 Bytes --> Linux box
>  6) Windows Client <-- icmp max 1492 Bytes -- Linux box
>  ...
>
> I guess the "clamp-mss-to-pmtu" hack only work for the destination
> network - or is that a bug ? The second packed comming from the ppp-IF
> go throu without change.
>
> One solutin is to reset the DF-Bit - but how ?
>
> The other way is always sutract 100-200 bytes from the mss
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
> 800:899  -j TCPMSS --set-mss  700
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
> 900:999  -j TCPMSS --set-mss  800
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
> 1000:1099 -j TCPMSS --set-mss  900
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
> 1100:1199 -j TCPMSS --set-mss 1000
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
> 1200:1299 -j TCPMSS --set-mss 1100
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
> 1300:1399 -j TCPMSS --set-mss 1200
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss 1400=
:
> -j TCPMSS --set-mss 1300
>
>
> Any other idea ?
>
> Mit freundlichen Gr=C3=BC=C3=9Fen
>
> Holger Burmann

I have same problem some time later. My uplink not pass tcp-packets whith=
=20
length more then 1496 bytes. I solve this by cleaning DF-bit in all outgo=
ing =20
tcp-packets. Linux by default not allow clear Df-bit and I'm wrote small=20
kernel modules and patch for iptables for clearning DF-bit. Downdload fro=
m=20
here:
http://mordor.strace.net/iptables/ipt_DF.tgz - for 2.4 kernels
http://mordor.strace.net/iptables/ipt_DF-2.6.tgz - for 2.6 kernels
http://mordor.strace.net/iptables/iptables-1.2.7.DF-patch.diff.bz2
http://mordor.strace.net/iptables/iptables-1.2.9.DF-patch.diff.bz2
Use:
for clear DF on outgoing packets:
iptables -t mangle -A POSTROUTING -j DF --clear
for clean DF on incoming packets:
iptables -t mangle -A PREROUTING -j DF --clear
And also other iptables options is allowning.

--=20
/bye
----------------------------------------------------------------------
Dmitry U.Labutcky                  System administrator of Swift Trace
mail to: avl@strace.net            Simferopol, Crimea, Ukraine
phone:   +380-652-516546           Yaltinskaya 20, office 502


