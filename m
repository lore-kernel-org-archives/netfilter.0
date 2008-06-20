From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 15:03:37 +0200
Message-ID: <485BAAA9.3080906@freemail.hu>
References: <624017.96549.qm@web52002.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <624017.96549.qm@web52002.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: rdkehn@yahoo.com
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Doug Kehn =EDrta:
> The connections do hang if I change the rule to:
>
> iptables -t raw -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i eth0 =
-p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -j NOTR=
ACK
>
> This makes sense, I believe, because the ACK to the SYN-ACK wouldn't =
be tracked and the connection state would never reach ESTABLISHED.
>  =20
What about the UNTRACKED state???
> Regards,
> ...doug
>  =20

Swifty

