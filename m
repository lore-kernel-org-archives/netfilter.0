From: Steffen Weinreich <steve@weinreich.org>
Subject: Re: nftables stateless NAT in raw table mangles fragmented UDP
 packets
Date: Tue, 4 Jan 2022 19:38:51 +0100
Message-ID: <b68d1a2f-b930-a1dc-df5f-5ed79af18497@weinreich.org>
References: <cdb7af33-1e07-05b7-a9d9-142d06d9cbfe@weinreich.org>
 <Yc8Hpu/5LPyT5HIU@salvia> <Yc8H9sHapPLHKWXV@salvia>
 <6df4612e-717e-9392-97f7-724c006a64f7@weinreich.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weinreich.org;
        s=dkim; t=1641321532;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-transfer-encoding:content-language:in-reply-to:references;
        bh=C1t6FCJHKWEQu5iRIYJjshcnIvl5dWCzOpXM/96zVgQ=;
        b=PkVE0/UvPCO/BzLlNqvXNz0DKowkTdln0X241GmCeZaF+NhwKuD8Z52fM0zf7s0WBcfAEW
        iH65y11UfPRAseTZUP2e/y105Kbqp0fvbrcTnBZvI/386p4XU94heg5d7u5lQBKiKQF1ua
        KtH3ME2OeJAV0ksmDHapHAp6S36aox0GybCWXrQM7pAea7wdLn/tgVmY0GUKuUcBRTn55I
        b5bX2xSdRczN5Eo9g0F9/2boCXe3acFfRPWDvcSc8jxUlwrqa7iB9s9o0LrEb2uOXJpNF0
        2IcnIlmKqn9e9V4+yHsRaGmpMjBDQhdlv6WGrFEW/vmrHeDpuUYDZnrWIpDykg==
In-Reply-To: <6df4612e-717e-9392-97f7-724c006a64f7@weinreich.org>
Content-Language: de-AT-frami
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo

Am 04.01.22 um 12:27 schrieb Steffen Weinreich:
> Hi Pablo,
>
> Am 31.12.21 um 14:39 schrieb Pablo Neira Ayuso:
>>> Could you give a try to this kernel patch?
>> Wrong patch, attaching again.
> Yes, that patch fixes the issue.

Meanwhile I tried that patch on a 4.19 Kernel. Since the struct
nft_pktinfo pkt does not have a member fragoff the patch does not work
on 4.19

Any chance to get a patch for a 4.19?  We are still using the debian
buster 4.19 kernel  series on out production systems and are currently
not able to move to a newer kernel due to issues with the userland nft
tools and our wrapper around them..

cheerio

Steve

