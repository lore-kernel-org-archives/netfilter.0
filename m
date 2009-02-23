From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] conntrack-tools 0.9.11 released
Date: Mon, 23 Feb 2009 08:17:30 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0902230815570.20446@fbirervta.pbzchgretzou.qr>
References: <49A03C73.8010004@netfilter.org> <20090222233433.0dc8f396@liberty.rlwhome.lan>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20090222233433.0dc8f396@liberty.rlwhome.lan>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robby Workman <rw@rlworkman.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Monday 2009-02-23 06:34, Robby Workman wrote:
>On Sat, 21 Feb 2009 18:40:03 +0100
>Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
>> The netfilter project presents another development release of the
>> conntrack-tools...
>
>I thought I recalled seeing discussion about this already, but I don't
>see it in my archives, so maybe not.   With glibc-2.7, this release
>builds fine; however, with glibc-2.9, both src/mcast.c and
>src/sync-mode.c need limits.h included, or else INT_MAX is undefined.

This builds fine for me - and I am on glibc 2.9.
Just *what* is it in (which distro? Debian/Ubuntu again?)
again to constantly fail on INT_MAX?
