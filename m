From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Ask an issue about how can I let netfilter-nat work normally, thanks
Date: Wed, 30 May 2012 12:59:03 -0400
Message-ID: <CACuyg24uZuUda3xEGD1bAVspH1WALoZ9ma+E0UbsNDb8V6Rxvg@mail.gmail.com>
References: <BAY146-W327D42337C6D284F3060A6900A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=A7JS4XwZefYEf0vT8VGbDjliI7ooOjucGU8xniENMh4=;
        b=JfiZJJHe87PsNmon4/on29DmmJVw2uFmNczEbbv63duBgLQozCTPLQwr9qdduLZ8eO
         zQ94gLodW/F3wQJZeB6o+OrnP+HORCD1aLDCnsOLC9A2nfEiKdylK/MeqWnI0gGXZvx+
         0as6KyCj74TGDG8TqaycJR67p2Mfd8vH1H01qWXyN/cqS+s0P+QPFQsbkOYggBbf2IrW
         1mjgyJRL2GEXCFX8Aqx5OYsuEs8xg58czqHiuF/jspRfGQxrDYhardODyFGAx9EkQSdd
         b9iSYc9hRAzQMCciJIVViL85xdgdtIDYGcQVx+pE8ZfMY/nrI3A/e1w1P+lvHRDPkRSy
         +5NQ==
In-Reply-To: <BAY146-W327D42337C6D284F3060A6900A0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: miao hongbing <miao_hb@hotmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Show us your NAT rules...
iptables -t nat -nL -v
or
=46irewall dump with iptables-save


Use tcpdump to see if the IP translation occurs.
tcpdump -i <if_net> host <ip_address> -n


2012/5/30 miao hongbing <miao_hb@hotmail.com>:
>
>
> Hi Sirs,
>
> I am Steve Miao from China, currently we use broadcom's WiFi chipset,=
 the chipset version is 5356 =A0the software version is linux-2.6-route=
r-5.70.48.10.
>
> We meet an issue about fast-nat, we plan to remove fast-nat and use c=
ommon netfilter-nat base some reasons, when we removed fastnat by disab=
ling CONFIG_BCM_NAT(the option of kernle's menuconfig) or let "ipv4_con=
ntrack_fastnat=3D0", =A0fast-nat is disabled succesfully, but netfilter=
-NAT can not work normally, the phenomenon is: =A0we can ping any websi=
te, =A0can not surf =A0it. that means ICMP can work normally but TCP/UD=
P can not.
>
> Could anyone pls tell me how I can let netfilter-NAT work normally? i=
f you know it pls kindly let me know.
>
> Thank you very much!!!
>
> Regards,
> Steve =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
