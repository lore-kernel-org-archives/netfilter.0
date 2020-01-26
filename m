From: "" <kfm@plushkava.net>
Subject: Re: Bulk loading of IP addresses or subnets in nftables?
Date: Sun, 26 Jan 2020 11:36:57 +0000
Message-ID: <199029b9-994b-421a-7a6f-ff27d9944970@plushkava.net>
References: <8856312f-553c-f751-bd0b-aa230fda6d11@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=P
        OF+2TIZLDzsBvb29BGCWoD9Y9d/zX0pjZP+T27dXb4=; b=eLe42aU6j7cE40giF
        7MMg9dzmLURanGod0Nuwiv7fyqQCpN7Vxppch3o3fyzLxJ4kYqcHBJ/3GShCQlBe
        Cn/fcruchK1c6bnCtg4P6c8XNhGoMUJfTDKSlwJE6Gm+6e/5MBB8ZbGbhEZSJisd
        jHpavaHheYJYh50h9bEBFTovooohKfT3Bhur8wbIxUD108yd28nUbjFwMY1QQEeK
        ZMF1ti1lIemDASj2AMyb2JYbZOHdr0pH+IPSevK7fPIIaKRnMEwySmykOjpc96ib
        OKbFI+uyQzBinHL8KVBChUr33RBd7d+pa9b+MZXUtqVFm709O4LZwkFFdfNAP1kq
        1tmWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=POF+2TIZLDzsBvb29BGCWoD9Y9d/zX0pjZP+T27dX
        b4=; b=b2imItpIQtOgQDQpt3RdzPyrxVIxCmkrlFBCbq5v6HLrjrmu1kW7vdDKY
        YavMi7sUz9yrzDFnrlJbGWwO6H3aNUjdrtj1AnxIcNvLpQvHcB45Bssg5y8f5blG
        sk1VOyT/eHUci1aRZvbvbx8hoNBmlq2BELlWhGV4OJiUkmiGmFUhWzseoFGKMS6A
        Uwf+1vv14BbH38NgLfJbbKp4ZEUguL+iEhINuHzVUqnMTx14bw/fLQw5TkBfhIg/
        LLRBh9Dsh+HvwtmGadb5eswWR+jXyQJri7DhS1slpaY/c51OJXrt1ZY8Ew/gCYP5
        sCTIVy62Ovm4MTkA/4m42Fi+x0DaQ==
In-Reply-To: <8856312f-553c-f751-bd0b-aa230fda6d11@gmx.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 26/01/2020 04:18, Lars Nood=C3=A9n wrote:
> In nftables, I'd like to apply a rule or set of rules to a very large
> number of IP addresses and subnets and looking for the recommended best
> practices for that: Should I make a new chain with one address or subnet
> per rule, should I use a dictionary, or should I try using a set, or
> does it matter?  The list would be read at boot but not usually updated
> much between boots.  Which method would operate most efficiently once
> the addresses and subnets are loaded?

It matters. Rather than individual rules, you should definitely use a=20
set if you can.

Lately, I have been experimenting with methods to populate large sets=20
from arbitrary sources. I determined that the fastest way should be to=20
execute a single "add element" command that includes all of the=20
elements. For newline-delimited input, here is a minimalistic script=20
demonstrating one way to go about it:-

#!/bin/sh
srcfile=3D$1
shift
{
	echo "flush set $*"
	echo "add element $* { "
	tr '\n' ',' < "$srcfile"
	echo " }"
} | nft -f -

Assuming that this script is saved as "populate-set", it could be used=20
as follows:-

populate-set mynetworks.txt ip filter mysetname

It works by considering the first parameter as the file to read the list=20
of addresses/prefixes from, with the remaining parameters being passed=20
to the "flush set" and "add element" commands. The tr command is used to=20
convert newline characters to commas, as is required by the syntax of=20
the add command. Both commands are executed with just one invocation of=20
nft so that the operation is atomic (in theory).

Alas, I discovered that populating a set with a large number of elements=20
can cause nft and/or netlink to choke under certain circumstances. To=20
put "large" into context, I am testing with the IPv6 bogons list, which=20
consists of over 116000 entries. I reported this issue as=20
https://bugzilla.netfilter.org/show_bug.cgi?id=3D1392.

In an attempt to work around this issue, I experimented with executing=20
multiple "add element" commands in smaller batches but to no avail.=20
Instead, I found that the only defense is to ensure that out-of-band set=20
population occurs no more than once after the last "flush ruleset"=20
command. Otherwise, the population of the set is initially fast, but is=20
excruciatingly slow on the second and subsequent occasions. Flushing the=20
entire ruleset seems to obviate the circumstances under which this issue=20
occurs. Frankly, this instability makes it a nuisance as compared to=20
working with ipsets.

One other thing to keep in mind is that your set declaration will=20
require the "interval" flag in order to support (CIDR) prefixes. A lot=20
of people get confused by that. See=20
https://bugzilla.netfilter.org/show_bug.cgi?id=3D1380 as an example.

--=20
Kerin Millar
