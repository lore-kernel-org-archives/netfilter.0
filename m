From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: ssh tunnel to port forwarded over localhost
Date: Sun, 8 Nov 2009 13:28:36 -0500
Message-ID: <200911081228.39416.rob0@gmx.co.uk>
References: <4AD5B1C9.6020609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD5B1C9.6020609@gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

[reply-to ignored, posted to the list where I read the OP]

On Wednesday 14 October 2009 06:11:05 Tito wrote:
> First, I would like to say that I have searched really long time
> through historical list archive of netfilter and other forums but
> I was not able to find the functionality I was searching for!

Was any of your searching done in man pages? Specifically
ssh_config(5):

    GatewayPorts
             Specifies whether remote hosts are allowed to connect
             to local forwarded ports.  By default, ssh(1) binds
             local port forwardings to the loopback address.  This
             prevents other remote hosts from connecting to
             forwarded ports.  GatewayPorts can be used to specify
             that ssh should bind local port forwardings to the
             wildcard address, thus allowing remote hosts to
             connect to forwarded ports.  The argument must be
             ``yes'' or ``no''.  The default is ``no''.


> I have found only this =E2=80=9Cport forwarding through localhost =E2=
=80=9D
>
> http://marc.info/?t=3D116984915600001&r=3D1&w=3D2 but it is not exact=
ly that!
>
> Here is the situation:
>
> Host A (Germany - my home laptop =E2=80=93 Windows XP)
> Router (Bulgaria - public ip ) =E2=80=93 Linux openSuse 11.1 Xen Linu=
x
> clients-pools 2.6.27.29-0.1-xen #1 SMP 2009-08-15 17:53:59 +0200 x86_=
64
> x86_64 x86_64 GNU/Linux
> Host B (192.168.1.10  which is a Xen virtual host installed on a Rout=
er
>   itself - Windows XP )Host B can ping any public ip address and can
> reslov dns names.
>
> The Router  have 2 open port:
>   55431  openSSH
>   54322 forwarded to HostB - 192.168.1.10 to port 3389 for remote des=
ktop!
>
> Now, the port forwarding is working just great, I can reach  the remo=
te
> desktop of Host B from Host A, but I want to close that port and let
> everything be forwarded over a ssh tunnel. I have done this for squid
snip

(I had started this reply 3 weeks ago, it was forgotten, but here it
is now, in the hope that it might be useful.)
--=20
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
