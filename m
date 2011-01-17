From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 07:03:01 -0600
Message-ID: <20110117130301.GC6659@cardinal>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Jan 17, 2011 at 09:43:27AM +1100, Ben K wrote:
> I'd like to be able to mangle strings passing through my home 
> router running Openwrt in order to modify/anonymize user-agent 
> strings. I believe a patch further extending the iptables string 
> extension by providing string replace functionality was submitted 
> by Michael Rash back in 2004 (archived at 
> http://www.spinics.net/lists/netfilter/msg23791.html). This would 
> be ideal as I could then mangle user-agent headers without eg 
> needing to run an http proxy.

I don't see why that's ideal. The proxy solution seems like the 
ideal, to me. While an openwrt router might not have the horsepower 
needed, neither does it have the horsepower you'll need for string 
matching. You're going to have to throw more hardware at this 
problem, however you might proceed.

> (BTW what's with the mailing list rejecting HTML emails?! Are we
> living in 2001?)

HTML posting on mailing lists is very rude. I usually ignore them. 
Gmail's implementation of it is particularly bad, converting many 
arbitrary strings into HTTP URI's.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
