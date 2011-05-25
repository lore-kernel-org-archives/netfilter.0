From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ULOG target in ip6tables?
Date: Wed, 25 May 2011 22:50:25 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105252249560.19500@frira.zrqbmnf.qr>
References: <BANLkTinm9MVSCrFH+Yk2uonuUK7Tyni9QQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTinm9MVSCrFH+Yk2uonuUK7Tyni9QQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kent Shultz <kentmshultz@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-05-25 22:42, Kent Shultz wrote:

>Hello,
>
>I am trying to get ulogd to work with ip6tables, but it seems there is
>no support for a 'ULOG' target -- there is no such file as
>'libip6t_ULOG.so' in my iptables lib directory.
>
>Does anyone know how to use ULOG as a target in ip6tables rules?

Use NFLOG, and preferably ulogd2.
