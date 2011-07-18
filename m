From: Autocad Learner <learn.autocad@yahoo.com>
Subject: Re: [MASQUERADE] Not changing to new source ip address when dynamically assigned in ppp link
Date: Mon, 18 Jul 2011 06:37:03 -0700 (PDT)
Message-ID: <1310996223.19606.YahooMailNeo@web121607.mail.ne1.yahoo.com>
References: <1310981976.47646.YahooMailNeo@web121603.mail.ne1.yahoo.com> <alpine.LNX.2.01.1107181242310.7358@frira.zrqbmnf.qr> <1310990054.84728.YahooMailNeo@web121619.mail.ne1.yahoo.com> <alpine.LNX.2.01.1107181407430.13166@frira.zrqbmnf.qr>
Reply-To: Autocad Learner <learn.autocad@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1310996224; bh=pXCEqXD6Zb6SMFxYRv5xPALRltxLRnc8/PnJdmUyVLE=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=ZsdLJb0Nzj0hS5oJbgHqAoroUc4VMcqf4MxZA/6amBIhxzuK8UuBmxIHZr9MEC4gfZWB2zBc8wGcCxJ/XiNESif2h6z+18ZIUEmookolcGFDPoilhI16m09J1/x5ZBoj8VSOBtYni75BfBDAQRnuETRXAJBQCgNOZLlKw5bXejw=
In-Reply-To: <alpine.LNX.2.01.1107181407430.13166@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>

Hi Jan,

Thanks again for your reply. I understand that I can not do much with t=
he current kernel. But i have to live with it for the moment.

If possible, can you please let me know the implications of setting the=
 ip_conntrack_udp_timeout to 0 if we use. I have also realised it is no=
t a sure shot workaround for this issue. I have increased the sleep int=
erval to 45 seconds and the source ip gets changed 80% of the time.

Thanks a lot.






----- Original Message -----
=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Autocad Learner <learn.autocad@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Sent: Monday, July 18, 2011 1:15 PM
Subject: Re: [MASQUERADE] Not changing to new source ip address when dy=
namically assigned in ppp link

On Monday 2011-07-18 13:54, Autocad Learner wrote:

>Hi Jan,
>
>Thanks for your quick reply.
>
>Unfortunately we cannot upgrade our kernels.=A0
>
>I would like to know if there is any clean work around to deal with th=
is
>issue.

You could clear the CT table on ppp-down... but that, too, is only
available in newer kernel versions.

[In other words, running old systems just works to your _complete_
disadvantage.]

>We do not want to do an iptables restart or server restart to take thi=
s
>effect.=A0 Also i saw in one of the posts i can set the ip_conntrack_u=
dp_timeout
>and ip_conntrack_udp_timeout_stream to 0 and revert back after 10 seco=
nds.
>Since i am a newbie, i am not sure whether this would affect any other
>application. Is it the best way to deal with this issue?
>
>To understand this problem:-
>
>The ip_dynaddr says it would update the ip address when the packet is
>retransmitted before we get any incoming packets from the destination.

I only glanced over it, but it seems ip_dynaddr is merely to cater for
address changes in the TCP SYN retry cycle during dial-on-demand.

