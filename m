From: "Anton 'EvilMan' Danilov" <littlesmilingcloud@gmail.com>
Subject: Re: how to ignore forwarded traffic?
Date: Mon, 21 Apr 2014 12:38:34 +0400
Message-ID: <CAEzD07Kz6bh16_YFTv-sgO0ZoXAneOwUUQt7=Kg6fy2b8LCY7w@mail.gmail.com>
References: <lj1rka$f3l$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=cY/hhyFrMbg6NSQijChJqTi3PzSbDlCwdmL/ExgkplQ=;
        b=0NhHhEUeHMNeMAVo/rmrM136Qx6CCaNWC8JLV4+kQQLgoicqgNkDhuyRhVyNyhj8zH
         GLJILMIBwb92t7sC8ofQY0MT/nEUpOdjDY1v9otCxjKxbXAof5r6MmDQGURgHPu7dI6J
         srrfqTelqlbgsHtWgAmy/2W8/l+qn4SutsYS+bQBlGBQkSGKC7vtN5+ehXXW6LZI0wCc
         VitNT/3N70eT5gcuVTgkAcXOQCY0ifx5w9NHJVAHleik9wqdjFGMA6J0/Mso1Cgn50Hj
         momMP1Y0Qn6vbn//+BD6ASaSoAO/b7N76gu7MDqaL1Bol1shn/q/kF5OO1KkhfDLRzT7
         fJqA==
In-Reply-To: <lj1rka$f3l$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?B?U3ZlbiBLw7ZobGVy?= <sven.koehler@gmail.com>
Cc: netfilter@vger.kernel.org

Hi, Sven.

You can disable conntrack at all by removing of the module.
Also you can disable conntrack only for specifyed connections with CT
target (--notrack option).


2014-04-21 5:22 GMT+04:00 Sven K=C3=B6hler <sven.koehler@gmail.com>:
> Hi,
>
> consider the following example:
> you have a router between two networks, and you want to cut off the
> router from the outside world using some iptables rules. However, all
> traffic that is forwarded by the router between the two networks
> basically is to be ignored by iptables (i.e., the router does not pla=
y
> firewall for any of the two networks).
>
> Currently, if conntrack is loaded on the router, then conntrack -L on
> the router lists all the connections, not only those to and from the
> router, but also all connections between the two. Certainly, it takes
> some CPU cycles for the router to keep track of all the connections.
> Also, the number of connections that conntrack can take of is limited=
=2E
>
> So is there a way to let Linux "bypass" conntrack and maybe other
> netfilter stuff when it comes to forwarded packets?
>
>
> Kind Regards,
>   Sven
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Anton.
