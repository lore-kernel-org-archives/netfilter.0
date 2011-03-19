From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: When does NAT processing actually takes place?
Date: Sat, 19 Mar 2011 11:02:35 +0100
Message-ID: <4D847F3B.2070303@plouf.fr.eu.org>
References: <282984944.21619.1300343429509.JavaMail.root@tahiti.vyatta.com> <1237758709.21621.1300343546963.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1237758709.21621.1300343546963.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steven Kath <steven.kath@vyatta.com>
Cc: Pandu Poluan <pandu@poluan.info>, netfilter@vger.kernel.org, Atle Solbakken <atle@goliathdns.no>

Steven Kath a =E9crit :
>
> Unless I'm mistaken, the "inverse NAT" is part of the conntrack set o=
f
> functions.

Unless I'm mistaken, the direct and inverse NAT is performed in the nat
hooks, called after the mangle chains. Destination NAT is performed in
the PRE_ROUTING or LOCAL_OUT (OUTPUT) hook, and source NAT is performed
in the POST_ROUTING or LOCAL_IN (INPUT) hook.

> The conntrack table contains both the pre-NAT and post-NAT
> address:port pairings,

Yes, but AFAIK this is only used for connection tracking purpose, so
that packets in the original and reply directions can be related to the
conntrack entry.
