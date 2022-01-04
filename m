From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables stateless NAT in raw table mangles fragmented UDP
 packets
Date: Tue, 4 Jan 2022 19:41:49 +0100
Message-ID: <20220104184149.GA938@breakpoint.cc>
References: <cdb7af33-1e07-05b7-a9d9-142d06d9cbfe@weinreich.org>
 <Yc8Hpu/5LPyT5HIU@salvia>
 <Yc8H9sHapPLHKWXV@salvia>
 <6df4612e-717e-9392-97f7-724c006a64f7@weinreich.org>
 <b68d1a2f-b930-a1dc-df5f-5ed79af18497@weinreich.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b68d1a2f-b930-a1dc-df5f-5ed79af18497@weinreich.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Weinreich <steve@weinreich.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Steffen Weinreich <steve@weinreich.org> wrote:
> Hi Pablo
> 
> Am 04.01.22 um 12:27 schrieb Steffen Weinreich:
> > Hi Pablo,
> >
> > Am 31.12.21 um 14:39 schrieb Pablo Neira Ayuso:
> >>> Could you give a try to this kernel patch?
> >> Wrong patch, attaching again.
> > Yes, that patch fixes the issue.
> 
> Meanwhile I tried that patch on a 4.19 Kernel. Since the struct
> nft_pktinfo pkt does not have a member fragoff the patch does not work
> on 4.19

You can substitute it with 'pkt->xt.fragoff'.
