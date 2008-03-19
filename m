From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Tcp segment size in linux
Date: Wed, 19 Mar 2008 22:11:18 +0000 (UTC)
Message-ID: <slrnfu33rk.ck9.petr.pisar@album.ics.muni.cz>
References: <195342.17620.qm@web33204.mail.mud.yahoo.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2008-03-19, rigoberto perez <rigo666beast@yahoo.com> wrote:
>
> In others Operating System like UNIX and WINDOWS, I
> can tell to TCP layer that not use the MTU to adjust
> packets size.
[...]
>
> My question is: Using netfilter or another system tool
> i can do the same or similar thing in Linux?
>
You can use TCPMSS target in mangle table of netfilter. It doesn't cut
the packets, it just changes advertised segment size of the TCP client's
SYN packet. However every compliant TCP stack should react on it. This
is usable on routers.

If you want to force the size already on end points, you can alter
routing table using "ip route ... advmss ..." command. See ip(8).

-- Petr


