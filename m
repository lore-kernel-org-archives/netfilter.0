From: Javier Almillategui <jalmillategui@mac.com>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines
 SSH-Tunnels
Date: Fri, 12 Aug 2011 07:35:19 -0500
Message-ID: <D36EB610-DA57-4882-8560-8EF7FD6B8F09@mac.com>
References: <4E44F1DC.3090605@gmx.de> <4E450A97.8070303@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <4E450A97.8070303@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ed W <lists@wildgooses.com>
Cc: "J. Zeidler" <jonatan_zeidler@gmx.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

=46irst of all, can you post the ssh tunnel syntax you are using?  In s=
sh you can specify which ip address will be used to bind the port tunne=
l. E.g: -L <local ip>:<local port>:<remote ip>:<remote port>.

Secondly, can you tell us the type of traffic you want transport over t=
he tunnel? You can pass as many -L syntax as needed to ssh.

Best,

Javier Almill=C3=A1tegui
Cibern=C3=A9tica S.A.

On Aug 12, 2011, at 6:12, Ed W <lists@wildgooses.com> wrote:

> On 12/08/2011 10:26, J. Zeidler wrote:
>> English:
>>=20
>> Hello,
>>=20
>> I use a SSH-tunnel with Putty on Ubuntu 11.04. I want to achieve, th=
at
>> the network traffic over a specific port is redirected over the tunn=
el.
>> I need this because of a strict firewall, which i can not configure.=
 the
>> tunnel runs on localhost:9999. i can use this as proxy with firefox,=
 so
>> the tunnel works. i tried this without success:
>=20
> Try OpenVPN (or your favourite VPN package, possibly SSH with the
> tun/tap whatever basic vpn mode?).  This is likely easier to setup an=
d
> tunnels all traffic out.  OpenVPN can also run over http connect with=
 a
> bit of configuration, so can slip out of fairly locked down firewalls=
=2E..
>=20
> Good luck
>=20
> Ed W
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
