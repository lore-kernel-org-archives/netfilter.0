From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: tag process's future sockets for iptables rules?
Date: Sat, 22 Oct 2011 22:43:04 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110222242100.17728@frira.zrqbmnf.qr>
References: <1RHeWb-0000Qb-4M@internal.tormail.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1RHeWb-0000Qb-4M@internal.tormail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "p. awa" <pawa@tormail.net>
Cc: netfilter@vger.kernel.org

On Saturday 2011-10-22 18:34, p. awa wrote:

>i used to do redirection and filtering based on the uid of a packet's
>local socket. the point was to transparently proxy an arbitrary process's
>outbound tcp connections through tor[1]. it had a nice enough interface:
>
>$ sudo torified-user wget http://example.com/
>
>then i switched to filtering based on gid instead of uid: having only
>the gid of regular files created by a process screwed with was less
>intrusive. but it is all still a hack that becomes unwieldy when you
>need more complex filtering rules.
>
>so i wonder if netfilter provides a facility that would allow a process
>to specify tags that are then added onto all sockets/connections/packets
>this process and its children create in the future, and to filter based
>upon those tags. something like:
>
>| netfilter_add_tag("public-addresses-proxied-via-tor");
>| netfilter_add_tag("internal-addresses-directly");
>| netfilter_remove_tag("proxy-dns");
>| execlp("wget", ...);
>
>plus corresponding iptables rules:
>
># iptables ... --with-tag    public-addresses-proxied-via-tor \
>               --with-tag    internal-addresses-directly \
>               --without-tag proxy-dns ...
>
>is there such a thing? of course it wouldn't have to be this interface

A socket option, SO_MARK, for use with setsockopt/getsockopt.
