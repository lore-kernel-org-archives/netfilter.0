From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: DNAT: IPv4 to IPv6
Date: Tue, 17 Dec 2013 12:15:47 -0500
Message-ID: <201312171215.47523.neal.p.murphy@alum.wpi.edu>
References: <20131217162409.GA17039@glanzmann.de>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20131217162409.GA17039@glanzmann.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday, December 17, 2013 11:24:09 AM Thomas Glanzmann wrote:
> Hello,
> I would like to DNAT IPv4 to IPv6. Is this currently possible maybe with
> nftables?

As far as I know, you cannot. IPv4 and IPv6 are totally different and 
incompatible protocols. You would have as much luck NATting IPv4 to Appletalk, 
NetWare or X.25.
