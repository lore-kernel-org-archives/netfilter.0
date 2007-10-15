From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: [ANNOUNCE] Release of iptables 1.4.0rc1
Date: Mon, 15 Oct 2007 19:18:13 +0000 (UTC)
Message-ID: <slrnfh7f7l.crr.petr.pisar@album.ics.muni.cz>
References: <47139AD0.8060002@netfilter.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2007-10-15, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> The netfilter coreteam proudly presents:
>
> 	iptables version 1.4.0rc1
>
Great to hear it. But it doesn't build ip6tables-{save,restore} as older
versions either. The problem is that these two makefile targets are in
*_EXP veriable.

It is bug or a feature?

PS: http://bugzilla.netfilter.org/ doesn't work.

-- Petr

