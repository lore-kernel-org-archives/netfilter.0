From: =?UTF-8?Q?Pekka_J=C3=A4rvinen?= <pekka.jarvinen@gmail.com>
Subject: Re: nftables port forward on DHCP interface to static IP
Date: Mon, 19 Apr 2021 20:22:19 +0300
Message-ID: <CABvnMchqLVxNWqqd36-0s+ug-aPi3kQe7UT6NnVedAHL=2MOyA@mail.gmail.com>
References: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
 <973b2d85-567a-e9aa-1b64-749a1fb116a5@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NnX+L0Nv39U7qeIMn960OjY7QnJg6pB+8b1okpTQYzU=;
        b=t+u7CzY+HgBFFGjgHK35TRO9p+V+uRkpTTtc6Q4D1nPhvR1KmneKnUfX6Z+ojIJU7T
         l0XmNnDfHfKURGIw8FMaC25/tJhBxmDDnwHGY3MrVGKDhqcfmz9AchciSzoP//Huu9hX
         MIvQqLY+SEAqUsNlzBxT5ItuvM2ZrOTL05nGGm8+TnyuL/N17hOyuLic/IEX1REt175b
         c+YgvJSkz7hyneA123sawucQwhrOFnSOMXjIsphHILZOyon4c88h49tCJ9a8i2SZERZc
         y1wzrU7y4B8ZfkKG+6oCuQCzyJCSWIP5P+LDguZz3EniK92YZQaDpBSDNCwV5oAP9qJh
         zkVw==
In-Reply-To: <973b2d85-567a-e9aa-1b64-749a1fb116a5@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

On Sun, 18 Apr 2021 at 22:23, Frank Myhr <fmyhr@fhmtech.com> wrote:
>
> Hi Pekka,
>
> Try:
> iifname $wanif tcp dport 12345 dnat 192.168.1.11
>
> or
> iifname $wanif tcp dport {12345} dnat 192.168.1.11
>         (but the braces are unnecessary unless you want to add more than =
one dport)
>
> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Addr=
ess_Translation_(NAT)#Destination_NAT

Thanks. I managed to fix it just moments ago. I had remnants of
iptables kernel modules which I blacklisted:

# cat /etc/modprobe.d/blacklist.conf
blacklist ip_tables
blacklist iptable_nat

I also upgraded kernel to 5.11.14.

This might have caused the whole line erroring earlier.

I moved NAT related stuff to ip (IPv4) filter instead of inet:

define wanif =3D wan0
define lanif =3D lan0
define home_net =3D 192.168.1.0/24
define home_net_gw =3D 192.168.1.1

# Port forwards
define port_fwd_ip =3D 192.168.1.11
define port_fwds_udp =3D {12345}
define port_fwds_tcp =3D {54321}

# IPv4 & IPv6
table inet filter {

   # ...

   chain forward {
       type filter hook forward priority filter; policy drop;
       ct state invalid drop

       # ...

       # Port forward WAN -> LAN
       iifname $wanif oifname $lanif tcp dport $port_fwds_tcp accept
comment "Accept forwarded TCP"
       iifname $wanif oifname $lanif udp dport $port_fwds_udp accept
comment "Accept forwarded UDP"
   }

   # ...

}

# IPv4
table ip filter {

   # NAT
   chain prerouting {
       type nat hook prerouting priority dstnat; policy accept;
       ct state invalid drop

       # TCP SYN (CT NEW)
       tcp flags & (fin|syn|rst|ack) !=3D syn ct state {new} drop

       # Port forward WAN -> LAN
       iifname $wanif tcp dport $port_fwds_tcp dnat to $port_fwd_ip
comment "Port forwards TCP"
       iifname $wanif udp dport $port_fwds_udp dnat to $port_fwd_ip
comment "Port forwards UDP"
   }

   # NAT
   chain postrouting {
       type nat hook postrouting priority srcnat; policy accept;
       ct state invalid drop
       oifname $wanif masquerade persistent comment "MasqNAT"
   }
}

--=20
Pekka J=C3=A4rvinen
