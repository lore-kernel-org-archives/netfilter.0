From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT with forwarding to multiple destinations
Date: Thu, 2 Dec 2010 14:33:34 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012021430220.5361@obet.zrqbmnf.qr>
References: <AANLkTinoWt8qNJKYhyjHbM5oOb-V6_aNAqTm=EJmU1Gn@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinoWt8qNJKYhyjHbM5oOb-V6_aNAqTm=EJmU1Gn@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alberto Quattrini Li <alberto.quattrinili@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-12-02 13:38, Alberto Quattrini Li wrote:

>Hi,
>
>I would like to know if there is any way by using NAT feature to
>forward a message to multiple destinations. I know that there is the
>package TEE, but that works at IP level, and so you can duplicate the
>packet to another host (i.e. specifying another address, but not the
>port). Moreover I know that specifying a range of port in
>to-destination just load-balances the traffic flow within that range,
>so that solution doesn't work.
>
>For example, let's say that I have a server that wants to broadcast a
>message to different clients on the same machine (so identified by
>localhost:port; each client has different port obviously).
>So it would be very easy if the server can send the message to the
>"broadcast port" and when netfilter intercepts it, by matching that
>broadcast port as destination port, netfilter would forward it to
>destinations specified by the rule.

NAT does not do forwarding, and neither does Netfilter - routing will.

The multiplexing you want is probably best done with a program that does 
just that - think of sprucing up rinetd.
