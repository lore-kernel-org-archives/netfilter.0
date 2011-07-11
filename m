From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: version iptables for ipt_netflow module
Date: Mon, 11 Jul 2011 13:24:03 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107111322230.10829@frira.zrqbmnf.qr>
References: <CAMTjHrzXUurGw_os492cUeFUwFK-hu6BqN0qcLyCdV6hPa72OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrzXUurGw_os492cUeFUwFK-hu6BqN0qcLyCdV6hPa72OQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Monday 2011-07-11 04:50, Usu=C3=A1rio do Sistema wrote:

>Hello everyone,
>
>I'm needing install ipt_netflow module on my Linux CentOS machine
>,which, is with iptables version 1.3.5
>
>when I go to compile appear the error follow:
>
>Kernel version: 2.6.18-238.12.1.el5
>Iptables binary version: 1.3.5 (detected from /sbin/iptables)
>Searching for iptables-1.3.5 sources..
>! Error: Can not find iptables source directory, try setting it with -=
-ipt-src=3D
>
>I've done test with iptables 1.4.6 version on other machine and it's
>work. but I wish that work on iptables version 1.3.5 because my
>firewall be this iptables version.
>
>is possible it's work ipt_netflow module on 1.3.5 iptables version ?

Ask ipt_netflow. Using iptables >=3D 1.4.3 is certainly easier because =
it=20
has proper development integration (version identification, path=20
locations, files in /usr/include, pkg-config, et al.)
