From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: dropping packets of --ctstate INVALID stopped working with 2.6.39.1?
Date: Fri, 24 Jun 2011 20:23:53 +0200
Message-ID: <4E04D639.2040905@plouf.fr.eu.org>
References: <BANLkTinjipDzpFaz9pZN_TijmR0qOx-=AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTinjipDzpFaz9pZN_TijmR0qOx-=AQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sam Roberts <vieuxtech@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Sam Roberts a =E9crit :
> I thought only a SYN packet should create a new connection, but PSH
> packets seem to do it, too, now.
[...]
> Our assumption was that if we deleted the connection, that any furthe=
r
> TCP packets for that flow would have a ctstate of INVALID

This behaviour is controlled by the net.netfilter.nf_conntrack_tcp_loos=
e
sysctl. Quoting Jozsef Kadlecsik :

>> With tcp_loose enabled (default) conntrack accepts non-SYN packets a=
s=20
>>"NEW" ones, i.e. attempts to pick up connections from the middle.

> This worked with 2.6.38, but doesn't work with 2.6.39.1.

Does the above sysctl have the same value on both kernels ?
