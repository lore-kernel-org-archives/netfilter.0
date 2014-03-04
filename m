From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Multipath routing x kernel > 3.6 (without routing cache)
Date: Tue, 4 Mar 2014 09:34:13 -0400
Message-ID: <CACuyg24+Wyo-gjWhGNkgyh4chts=hrwwtm5dMy+t7NMGcKekbA@mail.gmail.com>
References: <CACuyg26ntrABcy39_Obtf+cUKMnOcMtwoE45ZEJkdR=WtwvPdA@mail.gmail.com>
	<CACuyg25Jzj6VAXhTOj3sz4TYaP6Y13vAhwVEPyer6M3LBcGHSw@mail.gmail.com>
	<1393923397.15202.5.camel@rybalov.eng.ttk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=9LaIs3NEYG476yM3yFEWZlLfauIh1an0qr1/4xjcqcM=;
        b=1I10hcNcisvHmEHrhZHCHkRYOR5Crki6FmWviGN1AAjbOtCYIBnqqGO3IVibRz02a/
         vYso1MxppBD2K8LNjx7ToIo8Q6FCubwtfiYQV2szyqFLdvkheeElX+Qn2H0tr2mT1oIP
         EU3BFT29ElNE441DoAhULtgI8PCoch3zaMGzAphKXbKVvEQwELpPzyAM9HyiDXF978fk
         6ITLXr3U7xH3m7k2C2v+Uzpkhl1g/L8Yxf0M4G0NsEyMSbYZEXY6jGLendvpKc5eStZ4
         qaY1QL5QEvbV2R4R49Evor2I96FpvoNKXZtfUdRK3IhgfwuQaPjd/5EgQukVaW8MCpXg
         BUdA==
In-Reply-To: <1393923397.15202.5.camel@rybalov.eng.ttk.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>, netfilter@vger.kernel.org

Thanks for reply.

My intention was try to reproduce the logic of the routing cache using
the firewall rules (by conntrack).

The problem with using only the CONNTRACK/CONNMARK is a balancing per
connection. Many web applications use a control session internally.
And most of the time we do not have this persistence by socket. I've
had problems with this before. Imagine your public IP addr changing
between a connection and another for the same destination. For this
reason I wanted to find a way to control it by "flow".

Apparently I got a better result than the routing cache.

Before I increased the amount of gc_timeout just to ensure a greater
time for the flow in question. The problem is that it forced me to
have a script in the background to handle failover. And decrease the
value of gc_timeout would bring me more problems (a lot of people
recommended to do this as failover, but it certainly brings you
problems with the control session).

Now i define and update the timeout by ipset. If the link becomes
unavailable, the packet is retransmitted in round-robin and the next
link is attempted. The result was better than that obtained previously
with gc_timeout. May not need more failover script (I'm still not sure
about this). Now I see this as a real advantage.


I changed the logic of my firewall script to generate this:

-N GETMARK
-A GETMARK -m mark --mark 0x0 -m set --match-set lb_link1 src,dst,dst
-j MARK --set-xmark 0x301/0xffffffff
-A GETMARK -m mark --mark 0x0 -m set --match-set lb_link2 src,dst,dst
-j MARK --set-xmark 0x302/0xffffffff

-N SETMARK
-A SETMARK -o eth0 -m mark --mark 0x0 -j MARK --set-xmark 0x301/0xfffff=
fff
-A SETMARK -m mark --mark 0x301 -j SET --add-set lb_link1 src,dst,dst
--exist --timeout 1200
-A SETMARK -o eth1 -m mark --mark 0x0 -j MARK --set-xmark 0x302/0xfffff=
fff
-A SETMARK -m mark --mark 0x302 -j SET --add-set lb_link2 src,dst,dst
--exist --timeout 1200

-N CNTRACK
-A CNTRACK -o lo -j RETURN
-A CNTRACK -o eth0 -j SETMARK
-A CNTRACK -o eth1 -j SETMARK
-A CNTRACK -m mark ! --mark 0x0 -j CONNMARK --save-mark --nfmask
0xffffffff --ctmask 0xffffffff



-P OUTPUT ACCEPT
-A OUTPUT -m mark --mark 0x0 -j GETMARK
-A OUTPUT -m mark --mark 0x0 -j CONNMARK --restore-mark --nfmask
0xffffffff --ctmask 0xffffffff

-P PREROUTING ACCEPT
-A PREROUTING -m mark --mark 0x0 -j CONNMARK --restore-mark --nfmask
0xffffffff --ctmask 0xffffffff
-A PREROUTING -m mark --mark 0x0 -j GETMARK

-P POSTROUTING ACCEPT
-A POSTROUTING -j CNTRACK

Thanks!


2014-03-04 4:56 GMT-04:00 Nikolay S. <nowhere@hakkenden.ath.cx>:
> =D0=92 =D0=9F=D0=BD, 03/03/2014 =D0=B2 13:54 -0400, Humberto Juc=C3=A1=
 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> Just an idea. Grab HMARK in prerouting, use this mark to select routi=
ng
> table. Then in input/output/forward/postrouting chains you can re-use
> fwmark for queue selection or anything else.
>
>
