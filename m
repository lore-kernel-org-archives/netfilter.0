From: Pandu Poluan <pandu@poluan.info>
Subject: Re: iptables-save bug?
Date: Fri, 18 Mar 2011 20:43:24 +0700
Message-ID: <AANLkTin5sqXCqo9RCS_5G9syUWjQy+ym4V0WB2R--BXx@mail.gmail.com>
References: <AANLkTikFzbKdjjddsJMr_Rb6-6w1bu1hwOzBCVXZU=X7@mail.gmail.com>
	<alpine.LNX.2.01.1103181427190.11439@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1103181427190.11439@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Fri, Mar 18, 2011 at 20:28, Jan Engelhardt <jengelh@medozas.de> wrot=
e:
>
> On Friday 2011-03-18 13:44, Pandu Poluan wrote:
>>Is instead saved as:
>>
>>-A PREROUTING -m conntrack --ctstate =C2=A0-m comment --comment "Don\=
't
>>process untracked" -j ACCEPT
>>
>>(i.e., the "UNTRACKED" option is missing)
>>
>>I don't know if the other --ctstate options are also missing.
>>
>>Details:
>>- iptables -v =3D=3D v1.4.4
>>- uname -a =3D=3D "Linux aeacus-4 2.6.32-29-generic-pae #58-Ubuntu SM=
P Fri
>>Feb 11 19:15:25 UTC 2011 i686 GNU/Linux"
>
> Well yeah if you want bugfixes, you will have to update.
>

Ah, so it's a known bug then?

No problem. Sorry for any inconvenience :-)

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
