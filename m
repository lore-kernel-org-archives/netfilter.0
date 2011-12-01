From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to drop an idle connection with iptables?
Date: Thu, 1 Dec 2011 11:39:37 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112011139290.4264@frira.zrqbmnf.qr>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org> <4ECF299D.9040005@gmail.com> <janteh$3ui$1@dough.gmane.org> <4ECF9C17.80804@gmail.com> <4ECFA41F.50105@oldum.net>
 <4ED0CE43.2060505@gmail.com> <CA+4D1sfSu77cv_b5R0R_SULDpGX-9i70AuxBguAqOcrN1EpWiw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+4D1sfSu77cv_b5R0R_SULDpGX-9i70AuxBguAqOcrN1EpWiw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: lu zhongda <luzhongda@gmail.com>, netfilter@vger.kernel.org

On Thursday 2011-12-01 11:22, Anatoly Muliarski wrote:

>Hi Lu,
>
>I suggest trying to drop invalid packets:
>iptables -I INPUT -m state --state INVALID -j DROP
>iptables -I OUTPUT -m state --state INVALID -j DROP

Or better yet, -m conntrack --ctstate INVALID.
