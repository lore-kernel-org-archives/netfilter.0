From: Patrick McHardy <kaber@trash.net>
Subject: Re: Warning: never matched protocol: ah. use extension match instead.
Date: Mon, 23 Jun 2008 16:07:45 +0200
Message-ID: <485FAE31.4050203@trash.net>
References: <1214229359.9717.34.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1214229359.9717.34.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

Thomas Jacob wrote:
> Could someone clarify what exactly the warning message in the subject
> (from ip6tables) is supposed to tell me?
> 
> It looks like that ip6tables -p ah (or -p in general) would match
> packets that contain an ah header as the last extension header whereas
> -m ah matches packets that contain an ah header at any position, but
> I'm not sure.

Almost. "-p" uses the first non-extension header (which can never
be AH), while "-m ah" matches on AH extension headers.

> The core of the question is this: how does one pass unspecified
> ipsec traffic in ip6tables (the way you could do with -p ah + -p esp in
> iptables)?

"-m ah" and both "-m esp" and "-p esp" should work.
