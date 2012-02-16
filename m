From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 13:01:55 +0100
Message-ID: <1329393715.3296.18.camel@ns014530.dcyb.net>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120216171909.3a3cd4c1@shiva.selfip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 2012-02-16 at 17:19 +0530, J. Bakshi wrote:
> 
> Ok, there is xtables-addons-common in my debian box.
> Could you please share your config to block p2p bandwidth ?

I think

# man xtables-addons, Section ipp2p
and/or
# iptables -m ipp2p --help

will help you.

You have to specify at least one ipp2p protocol to match:

$ipt -A FORWARD -m ipp2p --bit [...etc...]


--
Rob


