From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problems getting NOTRACK to do anything at all
Date: Fri, 02 Oct 2009 15:49:43 +0200
Message-ID: <4AC604F7.6060907@plouf.fr.eu.org>
References: <0d99e50d4f57cd74439c228559a6738c@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0d99e50d4f57cd74439c228559a6738c@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marcel Laverdet <marcel@laverdet.com>
Cc: netfilter@vger.kernel.org

Hello,

Marcel Laverdet a =E9crit :
>=20
> For some reason I can't seem to get the NOTRACK iptables rule to do
> anything at all. Can anyone make sense of the following session which=
 I
> think describes the problem better than words could. The session belo=
w was
> carried out on a reasonably busy server, and I didn't waste much time=
 in
> between each command.
[...]
> fantasma marcel # iptables -t raw -A PREROUTING -i lo -j NOTRACK

I guess the raw/PREROUTING chain is too late for local traffic. Locally
generated packets are processed by conntrack in the NF_IP_LOCAL_OUT hoo=
k
unless the NOTRACK target was used in the raw/OUTPUT chain.

Try this instead :
iptables -t raw -A OUTPUT -o lo -j NOTRACK
