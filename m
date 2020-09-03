From: Florian Westphal <fw@strlen.de>
Subject: Re: Failing to construct a 'set' for TCP Flag filtering.
Date: Thu, 3 Sep 2020 16:24:39 +0200
Message-ID: <20200903142439.GL7319@breakpoint.cc>
References: <S1728814AbgIBQSI/20200902161835Z+839@vger.kernel.org>
 <4c39e878-8c4d-24a8-543e-206e1ca0a458@gmch.uk>
 <20200902175133.GA5283@salvia>
 <ae5d9b55-b77d-0a1e-d236-be67eb9333ce@gmch.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ae5d9b55-b77d-0a1e-d236-be67eb9333ce@gmch.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Hall <nftables@gmch.uk>
Cc: netfilter@vger.kernel.org

Chris Hall <nftables@gmch.uk> wrote:
> On 02/09/2020 18:51, Pablo Neira Ayuso wrote:
> > On Wed, Sep 02, 2020 at 05:44:11PM +0100, Chris Hall wrote:
> >> .... issue with 'add set ip MAIN tcp_good_flags...'
> > > Indeed, nothing seems to work until I 'flush ruleset' again !
> > > 
> > > Am I asking for the impossible here ?
> 
> > It's a bug, I'll apply this patch to git.
> 
> Ah.  I'm impressed that it's quickly fixable...
> 
> ...but my Fedora appears to be 9 months behind on nftables v0.9.3, so I
> guess I have a bit of a wait :-(
> 
> I tried building nftables, but ./configure says:
> 
>   Package 'libnftnl' has version '1.1.3', required version is '>= 1.1.7'
> 
> I tried building and installing libnftnl, which created
> '/usr/local/lib/libnftnl.so.11.3.0'.  But that does not seem to satisfy the
> ./configure for nftables ?

It does, but its finding the wrong/old installation, or not searching in
/usr/local.

Try

 ./configure PKG_CONFIG_PATH=/path/to/where/the/1.1.7.pc-file-is

when building nftables.

find -name '*.pc' /usr/local

might tell you the right directory.
