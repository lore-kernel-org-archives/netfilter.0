From: whiplash <whiplash@bofhland.org>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Tue, 27 May 2008 09:49:09 +0200
Message-ID: <483BBCF5.2090106@bofhland.org>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org> <483B16F7.2010205@gmail.com> <483B2069.7010504@trash.net> <483B606E.9050305@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483B606E.9050305@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Filippo Zeus ha scritto:
> Considering ftp-control port is text based i've dumped with -A switch. I 
> hope it's ok
[cut]
> 52 packets captured
> 53 packets received by filter
> 0 packets dropped by kernel

It seems to me that the whole traffic is encrypted: there's no PASV
and no LIST in the hard-to-read tcpdump you sent (hiding ip is
useless, since you already sent the protfpd.conf with the
true ServerName...)
