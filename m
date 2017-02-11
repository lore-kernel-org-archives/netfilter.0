From: Michael Weiser <michael@weiser.dinsnail.net>
Subject: Match packet address against addresses on interface
Date: Sat, 11 Feb 2017 18:13:21 +0100
Message-ID: <20170211171321.GC31183@weiser.dinsnail.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

is there an elegant way in either ip{,6}tables or nftables to match
addresses in packets against all the addresses set on a specific local
interface?

I've seen this with pf where you can write "( if0 )" instead of a source
or target address to achieve just that.

As of now I have a small daemon monitoring rtnetlink events, using them
to maintain ipsets for ip{,6}tables which seems rather cumbersome and
fragile.
-- 
Thanks,
Michael
