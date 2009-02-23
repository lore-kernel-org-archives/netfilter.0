From: Robby Workman <rw@rlworkman.net>
Subject: Re: [ANNOUNCE] conntrack-tools 0.9.11 released
Date: Sun, 22 Feb 2009 23:34:33 -0600
Message-ID: <20090222233433.0dc8f396@liberty.rlwhome.lan>
References: <49A03C73.8010004@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <49A03C73.8010004@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sat, 21 Feb 2009 18:40:03 +0100
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> The netfilter project presents another development release of the
> conntrack-tools...


Hi Pablo,

I thought I recalled seeing discussion about this already, but I don't
see it in my archives, so maybe not.   With glibc-2.7, this release
builds fine; however, with glibc-2.9, both src/mcast.c and
src/sync-mode.c need limits.h included, or else INT_MAX is undefined.

-RW
