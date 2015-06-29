From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: xt_mac and NF_INET_POST_ROUTING
Date: Mon, 29 Jun 2015 23:25:14 +0200
Message-ID: <5591B7BA.5050100@plouf.fr.eu.org>
References: <CAAUC4VJhEAUpeHtducZma5QHtAtTANdEN-4aRHWYY6kt+R3tRA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAUC4VJhEAUpeHtducZma5QHtAtTANdEN-4aRHWYY6kt+R3tRA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Garret Kelly <gdk@google.com>
Cc: netfilter@vger.kernel.org

Garret Kelly a =E9crit :
> Is there some technical reason that xt_mac can't match in POSTROUTING=
?

I guess that it's because this hook/chain may sees locally generated
packets, which do not have (yet) a MAC header.
