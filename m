From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: RE: Iptables Rules
Date: Wed, 9 Apr 2008 19:03:22 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804091902030.3866@fbirervta.pbzchgretzou.qr>
References: <401296.6393.qm@web82604.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <401296.6393.qm@web82604.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minh Cao <minhcao123@yahoo.com>
Cc: Ukeme Noah <ukeme.noah@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2008-04-09 19:01, Minh Cao wrote:
>Thanks for your help !
>
>Please explain why these two acting differently.
>On #2 I can login as anonymous, but ls.
                                ^ but not ls

That's because in #2, you limit RELATED to port 21,
which is essentially meaningless.
In #1, RELATED applies to any port (as does ESTABLISHED).

>Can I combine two rules into one ?
>
>1/ 
>-A INPUT -m state --state RELATED,ESTABLISHED -j
>ACCEPT
>-A INPUT -m state --state NEW -p tcp -m tcp --dport 21
>-j ACCEPT

No.
