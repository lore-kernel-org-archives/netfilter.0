From: Eric Leblond <eric@regit.org>
Subject: Re: nft error
Date: Wed, 26 Feb 2014 11:18:31 +0100
Message-ID: <1393409911.6885.7.camel@ice-age2.regit.org>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matteo Croce <technoboy85@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, 2014-02-26 at 11:12 +0100, Matteo Croce wrote:
> Hi,
> 
> I'm trying to run nftables on Debian with a vanilla 3.13 kernel.
> I've compiled libnftnl and nftables from git, but when I try to start
> ntf I get this error:
> 
> # nft list table filter
> <cmdline>:1:1-17: Error: Could not receive sets from kernel: Address
> family not supported by protocol
> list table filter
> ^^^^^^^^^^^^^^^^

I think you did not create the filter table first:

nft add table filter

nftables comes without any chains. So you have to create your own.

BR,
-- 
Eric Leblond <eric@regit.org>

