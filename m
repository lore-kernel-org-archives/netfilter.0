From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: errors found in nftable docs on wiki
Date: Sun, 29 Jun 2014 12:12:50 +0200
Message-ID: <20140629101250.GA3615@localhost>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Johnson <ecybernard@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Jun 28, 2014 at 02:13:35PM -0500, Jonathan Johnson wrote:
> http://wiki.nftables.org/wiki-nftables/index.php/Sets
> 
> States this works and it does not.
> 
> 
> nft add set filter blackhole { type ipv4_address\;}
> 
> after reviewing the source code I discovered this is correct:
> 
> 
> nft add set filter blackhole { type ipv4_addr\;}

Fixed, thanks for reporting.

> after using the correct syntax I get this error, which I have not
> troubleshooted.
> 
> 
> I modprobed all the modules starting with nft* one at a time.
> 
> 
> <cmdline>:1:26-42: Error: Could not add set: No such file or directory

I guess you forgot to create the filter table?

http://wiki.nftables.org/wiki-nftables/index.php/Configuring_tables
