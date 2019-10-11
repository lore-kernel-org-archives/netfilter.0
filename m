From: Stephen Satchell <list@satchell.net>
Subject: Re: nft -- documentation on fib_addrtype missing, more data
Date: Fri, 11 Oct 2019 08:09:14 -0700
Message-ID: <2e830cec-e358-e400-e4e0-f4d191674bb4@satchell.net>
References: <5fbab89f-ee32-44f7-b8d7-cf63ba65bc0e@satchell.net>
 <20191011082926.4wfyhysc6joofuel@salvia>
 <20191011094721.GL25052@breakpoint.cc>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20191011094721.GL25052@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

TL;DR:  The existing invocation "nft describe fib saddr type" (which I
didn't find documented) provides information describing fib_addrtype.
Consider adding these invocations, described below:

    nft describe fib_addrtype
    nft describe cmds
    nft show type <ip-address>          and/or
    nft show fib_addrtype <ip-address>  and/or
    nft show route <ip-address>

On 10/11/19 2:47 AM, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> # nft describe fib saddr type
>> fib expression, datatype fib_addrtype (fib address type) (basetype integer), 32 bits
>>
>> pre-defined symbolic constants (in decimal):
> [..]
> 
> It might make sense to teach nft describe to also work with the type,
> so you could get the symbolic constants via
> 
> nft describe fib_addrtype
> 
> What do you think?

That's a good thing to do.  Instead of a verbose section, you can add to
"man 8 nft" before "Using fib expressions: this short paragraph:

> List valid fib_addrtype symbols using "nft describe fib_addrtype".
> Descriptions of their meaning can be found in the "RTM_NEWROUTE,
> RTM_DELROUTE, RTM_GETROUTE" section of man 7 rtnetlink
For the wiki, I suggest it would be better to pull the information
together.  Book and HOWTO authors can do the same thing, to minimize the
amount of cross-referencing.

What I would like to see in the wiki is an example routing table, with a
table of IP addresses and the value of fib_addrtype that would be
associated with it.

To assist the tech writer, add a new command:

    nft show type <ip-address>         and/or
    nft show fib_addrtype <ip-address> and/or
    nft show route <ip-address>

where "ip-address" is an IPv4 or IPv6 host address (not netblock).
Documentation for this would be added to the ADDITIONAL COMMANDS section
of the command page.  The command could show other information such as
the interface name and other routing information, that can be tested in
fib expressions, from the routing response.  I haven't found any tool to
provide this capability in the various network utilities.

While you are at it, consider adding "nft describe cmds" and adding a
line to the "nft --help" to tell the user to use this new facility.
Most Linux utilities would add this to the output of --help; I would
suggest keeping the list of command keywords separate.  (I thought about
"nft --help commands" as an alternative, but y'all might not like it.)

Isn't it great to have a complete noob like me coming on at this late date?
