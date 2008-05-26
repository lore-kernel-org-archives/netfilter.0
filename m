From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not
 understood
Date: Mon, 26 May 2008 21:28:04 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805262127230.19084@fbirervta.pbzchgretzou.qr>
References: <483B04A8.9000405@gmail.com> <483B06A1.6030907@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483B06A1.6030907@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Filippo Zeus <filippozeus@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-05-26 20:51, Filippo Zeus wrote:

> Hi,
> i think the ftp_contrack module has a bug.
>
> I'm setting up proftpd 1.3.1 with TLS for encrypting auth+data only traffic to
> let ftp_conntrack module understand the port command when a client connects to
> the server using a PASV mode.
>
> Look at link below and search for question
> Using mod_tls, FTP sessions through my firewall now no longer work. What's
> going on?
>
> ftp_conntrack module probably do no understand the port command so it do not
> open the port.

No, it does not understand because you are encrypting the channel with TLS.
Simple as that.

