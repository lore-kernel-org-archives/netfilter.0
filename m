From: Philip Craig <philipc@snapgear.com>
Subject: Re: MARK unexpectedly changed
Date: Fri, 07 Aug 2009 10:52:38 +1000
Message-ID: <4A7B7AD6.6030808@snapgear.com>
References: <1249560042.6492.52.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1249560042.6492.52.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

John A. Sullivan III wrote:
> What is going on? What is changing the marks? I was under the impression
> marks were only set in the mangle table.  I've scoured the mangle table
> and the only rule setting a mark is the one mention above which sets
> 0x80000000.

It will be a bug in the OpenSWAN code when it decompresses/decrypts the
packet.  It has its own skb copy code which seems to be badly out of date.
I've found one bug in the decompression path where it wasn't setting
the mark at all, but it seems like there is another bug somewhere too.
