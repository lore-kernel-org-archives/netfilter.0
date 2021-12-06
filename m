From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Mon, 6 Dec 2021 14:11:26 +0100
Message-ID: <Ya4L/rS/mCwzqt25@salvia>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amish <anon.amish@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Dec 05, 2021 at 05:25:29PM +0530, Amish wrote:
> Hello,
> 
> nftables wiki [1] mentions this:
> 
> > Note: There are plans to support rule deletion by passing:
> > % nft delete rule filter output ip saddr 192.168.1.1 counter
> 
> Any idea when will this happen? Because I thought it was very important
> feature. (unless I missed an alternate way to do it)
> 
> I want to migrate from iptables to nftables (from many years) but deleting a
> rule via script is not as easy as in case of iptables.
> 
> Obtaining the handle first and then deleting it is difficult
> programmatically.

You can use --echo and --handle options to fetch the rule handle.

 # nft -e -a  add rule x y counter
 add rule ip x y counter packets 0 bytes 0 # handle 3
 # new generation 5 by process 91190 (nft)
