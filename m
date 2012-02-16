From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 19:00:17 +0100
Message-ID: <1329415217.2595.3.camel@kushiel.sterenborg.info>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <1329411784.18690.463.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1329411784.18690.463.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 2012-02-16 at 17:03 +0000, Andrew Beverley wrote:
> On Thu, 2012-02-16 at 13:01 +0100, Rob Sterenborg (lists) wrote:
> > I think
> > 
> > # man xtables-addons, Section ipp2p
> 
> I believe that ipp2p is no longer maintained; their website recommends
> openDPI instead. I've never tried it myself, but it looks promising.
> 
> Personally I use the rather brutal technique of looking for several
> connections to high port numbers from a single client. I dare say there
> are false positives, but it works for me.
> 
> The details for that are here:
> 
> http://andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux

Yes, I read it too.
However, I wasn't referring to the ipp2p project that is no longer
maintained. I was referring to how to use the ipp2p match that comes
with xtables-addons, and that is what man xtables-addons is writing
about. (Correct me if I'm wrong..)


--
Rob


