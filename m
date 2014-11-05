From: Tannador <mail@tannador.com>
Subject: Re: Static mapping of private subnet to different private subnet
Date: Wed, 05 Nov 2014 16:38:15 +0100
Message-ID: <C19A8444-32E3-42C7-A646-7232BED5E809@tannador.com>
References: <F1992426-119C-4B69-ACE5-44772A062125@tannador.com> <54590B8F.2060703@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54590B8F.2060703@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Thanks for the quick reply.

Unfortunately, NETMAP seems to be a static version of standard NAT.
What I need is to replace the source address during prerouting and the =
destination address during postrouting. Thereby hiding the true IP of a=
n interface from the system.

Any ideas?

Kind regards,
tannador
--=20
Sent from my smartphone. Pardon typos and the short form.


>Did you look at the NETMAP iptables target?
>
>Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
>Noel Kuntze

