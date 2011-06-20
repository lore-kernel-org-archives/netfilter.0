From: "icukeng@gmail.com" <icukeng@gmail.com>
Subject: Re: Using interface name as a command line option to create a
 iptables rule
Date: Mon, 20 Jun 2011 19:39:16 +0400
Message-ID: <BANLkTimcN_Jw6zOuxeKTEFg8yVvjLqMh0A@mail.gmail.com>
References: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=P9ULq87CHUJKbpIP1VYVHiPAN01+Kiq9HX+lRUtelW4=;
        b=Q0MyOqnri2GbzmD2eefo7s/CH27ro395ADAahlBY32KYdU8io9540suiVOhrSX1+aY
         VdeYJTojBrdWNt5mWdnvVipwnpf1ctqIBvalJWcqO4NETzZaLvNMLnh/EQeGFw81Qyxi
         vcAJrZV4cM5QugJILsGqqlFYnAlXCiTBqg9eY=
In-Reply-To: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Adishesh M <adisheshsm@gmail.com>
Cc: netfilter@vger.kernel.org

if ssh listens only on 192.168.229.131 at port 22 these rules are equiv=
alent.
otherwise some user from another network (on another nic) can connect.

Another nuance is possibility of ip/arp spoofing - you can get
192.168.229.131 from eth1.

2011/6/20 Adishesh M <adisheshsm@gmail.com>:
> Hi,
>
> Is it mandatory (or recommended) to use interface as option to enable
> a particular port using iptables filter table.
>
> If we don=E2=80=99t use interface name while forming a rule, then are=
 we
> compromising anything with respect to security?
>
>
> For example
>
> We have two interfaces eth0 and eth1 with ip address as given below.
> We want to enable ssh service on eth1 and =C2=A0some other service on=
 eth2.
> For this we are using below rules
>
> Option 1:
> iptables =E2=80=93P INPUT DROP
> iptables -A INPUT =C2=A0 -i eth0 =C2=A0-d 192.168.229.131 =E2=80=93p =
tcp =C2=A0--dport 22 =C2=A0-j ACCEPT
> iptables -A INPUT =C2=A0-i eth1 -d =C2=A0192.168.124.135 -p udp =C2=A0=
--dport 5060 =C2=A0-j ACCEPT
> iptables =E2=80=93A INPUT =E2=80=93J DROP
>
> Option 2:
> Iptables =E2=80=93P INPUT DROP
> Iptables =E2=80=93A INPUT =C2=A0 =C2=A0=E2=80=93p tcp =C2=A0--dport 2=
2 =C2=A0-j ACCEPT
> Iptables =E2=80=93A INPUT =C2=A0 -d =C2=A0192.168.124.135 =C2=A0-p ud=
p =C2=A0--dport 5060 =C2=A0-j ACCEPT
> Iptables =E2=80=93A INPUT =E2=80=93J DROP
>
> In the above examples, which is more secure option?
>
>
>
>
> [root@adim ~]# ip addr list
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN
> =C2=A0 =C2=A0link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> =C2=A0 =C2=A0inet 127.0.0.1/8 scope host lo
> =C2=A0 =C2=A0inet6 ::1/128 scope host
> =C2=A0 =C2=A0 =C2=A0 valid_lft forever preferred_lft forever
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
> state UNKNOWN qlen 1000
> =C2=A0 =C2=A0link/ether 00:0c:29:53:6a:e0 brd ff:ff:ff:ff:ff:ff
> =C2=A0 =C2=A0inet 192.168.229.131/24 brd 192.168.229.255 scope global=
 eth0
> =C2=A0 =C2=A0inet6 fe80::20c:29ff:fe53:6ae0/64 scope link
> =C2=A0 =C2=A0 =C2=A0 valid_lft forever preferred_lft forever
> 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
> state UNKNOWN qlen 1000
> =C2=A0 =C2=A0link/ether 00:0c:29:53:6a:f4 brd ff:ff:ff:ff:ff:ff
> =C2=A0 =C2=A0inet 192.168.124.135/24 brd 192.168.124.255 scope global=
 eth1
> =C2=A0 =C2=A0inet6 fe80::20c:29ff:fe53:6af4/64 scope link
> =C2=A0 =C2=A0 =C2=A0 valid_lft forever preferred_lft forever
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
