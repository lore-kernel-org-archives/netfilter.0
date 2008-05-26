From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not
 understood
Date: Tue, 27 May 2008 00:32:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805270031480.19084@fbirervta.pbzchgretzou.qr>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org> <483B16F7.2010205@gmail.com> <alpine.LNX.1.10.0805270003570.19084@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805270003570.19084@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Filippo Zeus <filippozeus@gmail.com>
Cc: netfilter@vger.kernel.org, kaber@trash.net


On Tuesday 2008-05-27 00:05, Jan Engelhardt wrote:
>On Monday 2008-05-26 22:00, Filippo Zeus wrote:
>
>> I'm not shure, cause i'm not a developer, but i think that ftp_conntrak module
>> open a port *ONLY* if
>> it read first the USER command, then the PASS command, then PASV/PORT commands
>> not simply if a (cleartext) PORT command came from the ftp client.
>
>It sets up an expectation once it sees PORT/EPRT/PASV/EPSV,
>regardless of USER/PASS.
>
>It does *NOT* recognize the TLS commands SSCN/CPSV,
>which is probably the problem, if you claim that the control
>connection is clear-text.

Ah never mind, SSL using SSCN/CPSV seems obsolete since long.
