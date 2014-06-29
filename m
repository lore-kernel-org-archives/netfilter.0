From: Jonathan Johnson <ecybernard@gmail.com>
Subject: Re: errors found in nftable docs on wiki
Date: Sun, 29 Jun 2014 09:51:13 -0500
Message-ID: <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
 <20140629101250.GA3615@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=012KDDMgw2OZ26jYO5Dd0cCYyLoznSmyHkgcUaCDlLk=;
        b=zwWy6GsgNaj+efvYGk5ZMPgvrvnEg0XSfBr/X9uhWph1svsknA05ziWR37/0jpdvCg
         ben2l9KlaOm/88fS0fSbCInjgaxbFfdYRNslfZYrJc3OwOdVEwHhLhd1do/FHwnDNJbV
         bcD1bmBIKRN0F87ffOXHjb4j6a0PeI9ewjtuTw67KGEl67m0NARCH2WszPv6/oKJRXQh
         sQZMZZaSgFIpx67LR8Yae9myBsz9S3tfHrNUbYUvGu5fWltGl7sUPJ4t/8c1D2bolh/O
         a0zuiV1BVU6Ji6kD1RJCnT0Oe32HGwWkBd1/eEliDsvjXY2I3/tLCID6WeMdy/PuaV5L
         ZDNQ==
In-Reply-To: <20140629101250.GA3615@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

I followed your example and no go.

/sbin/nft add table ip  blackhole
nft list tables
results:  blackhole

nft add set filter blackhole { type ipv4_addr\;}
<cmdline>:1:26-42: Error: Could not add set: No such file or directory


Please send me a complete example.
I am trying to migrate my blacklist from ipset/iptables to nft since I
have 33,110 entries and counting.  I want to block all forms of
communication with there ip addresses.  I want to see how nft performs
by comparison.  Does nft have the 65,535 limit for list size?

Jonathan



On Sun, Jun 29, 2014 at 5:12 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Sat, Jun 28, 2014 at 02:13:35PM -0500, Jonathan Johnson wrote:
>> http://wiki.nftables.org/wiki-nftables/index.php/Sets
>>
>> States this works and it does not.
>>
>>
>> nft add set filter blackhole { type ipv4_address\;}
>>
>> after reviewing the source code I discovered this is correct:
>>
>>
>> nft add set filter blackhole { type ipv4_addr\;}
>
> Fixed, thanks for reporting.
>
>> after using the correct syntax I get this error, which I have not
>> troubleshooted.
>>
>>
>> I modprobed all the modules starting with nft* one at a time.
>>
>>
>> <cmdline>:1:26-42: Error: Could not add set: No such file or directory
>
> I guess you forgot to create the filter table?
>
> http://wiki.nftables.org/wiki-nftables/index.php/Configuring_tables
