From: Marco Padovan <evcz@evcz.tk>
Subject: Re: Conntrack & Unreplied exhausts hashsize
Date: Sat, 09 Jun 2012 20:15:53 +0200
Message-ID: <4FD392D9.9010706@evcz.tk>
References: <f8da378bd8c865bf9618b0d52f7b4441@njm.linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:x-enigmail-version:openpgp:content-type
         :content-transfer-encoding;
        bh=eFllwsc3G0Mom8jZ0JRDvS5EikOXDLjKFRUedbzv/d8=;
        b=Zliv7coxYIjSJLwnPx/227xiABwASTl3B/6cUA0A6TeRRbAT+luLlCSbi49uC1YYWl
         ydG3O3dRokMCYsxfvukwBA6Rf23/VvUbtuPgct5lNDf6lFK2vqW8rNX0Bdiq6P3b1IeO
         zmZx41aaxuR7ZT80iw+WmVX6pmXlM9SmTYpMk=
In-Reply-To: <f8da378bd8c865bf9618b0d52f7b4441@njm.linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org

Looks like it's an intendend behaviour:

http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.17

<<UNREPLIED entries are temporary entries, i.e. as soon as we run out of
connection tracking entries (we reach
/proc/sys/net/ipv4/ip_conntrack_max), we delete old UNREPLIED entries.
In other words: instead of having empty conntrack entries, we'd rather
keep some maybe useful information in them until we really need them.>>

when having the conntrack table full "error" did you still have
unreplied entries in the table?

Il 09/06/2012 17:12, Julien Vehent ha scritto:
> Hi everyone,
>
> I'm analyzing a configuration problem that we are encountering with
> conntrack at work. We have a farm of frontend servers that run apache.
> Those servers run into the classical table full problem:
>
>     Jun 5 09:57:51 web-front1 kernel: [7177214.445925] nf_conntrack:
> table full, dropping packet.
>
> So I started tuning the kernel of one member of the farm. This server
> has 2 interfaces: one public and one in the LAN. The problem is on the
> public interface, it seems that connections in the UNREPLIED state
> continue to grow and never get cleaned up by conntrack. Below is a
> diagram that shows the issue:
>
> http://4u.1nw.eu/conntrack_stat3.png
>
> The orange line counts connections on the public IP that are in the
> unreplied state. The script parses /etc/net/ip_conntrack every 10
> minutes (nothing fancy, see https://gist.github.com/2901349 ).
>
> My questions are:
>
> Should these UNREPLIED connection get removed from conntrack after a
> certain timeout?
>
> What is the parameter that controls this timeout ?
> I'm afraid it might be
> `net.netfilter.nf_conntrack_tcp_timeout_established = 432000`, which
> is 5 days. If this is the case, would it be safe to set this parameter
> to 300 seconds instead (5 minutes) ?
>
> Note: apache runs with `KeepAlive On` and `KeepAliveTimeout 3`, in
> case this might be relevant.
>
>
> Thanks a lot,
> Julien
>
>


