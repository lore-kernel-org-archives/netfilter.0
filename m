From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables-save bug?
Date: Fri, 18 Mar 2011 14:28:28 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103181427190.11439@obet.zrqbmnf.qr>
References: <AANLkTikFzbKdjjddsJMr_Rb6-6w1bu1hwOzBCVXZU=X7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikFzbKdjjddsJMr_Rb6-6w1bu1hwOzBCVXZU=X7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org


On Friday 2011-03-18 13:44, Pandu Poluan wrote:
>Is instead saved as:
>
>-A PREROUTING -m conntrack --ctstate  -m comment --comment "Don\'t
>process untracked" -j ACCEPT
>
>(i.e., the "UNTRACKED" option is missing)
>
>I don't know if the other --ctstate options are also missing.
>
>Details:
>- iptables -v == v1.4.4
>- uname -a == "Linux aeacus-4 2.6.32-29-generic-pae #58-Ubuntu SMP Fri
>Feb 11 19:15:25 UTC 2011 i686 GNU/Linux"

Well yeah if you want bugfixes, you will have to update.
