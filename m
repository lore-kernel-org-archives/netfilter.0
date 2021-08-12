From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Why aren't INPUT and FORWARD chains available to a
 locally-generated packet?
Date: Thu, 12 Aug 2021 09:58:04 +0200
Message-ID: <117a3084-b817-a0e4-8cfc-68db9d786b53@thelounge.net>
References: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
 <20210811142921.GW607@breakpoint.cc>
 <CACj4R39Whos6mVwo1CsvR7me61raq2udnxevjBYgMru3V__JGQ@mail.gmail.com>
 <20210811210919.GX607@breakpoint.cc>
 <CACj4R3_JQqkCSefPg=f4LNuB0zjPXbU9ctZFSvUo7nnVG99pRw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACj4R3_JQqkCSefPg=f4LNuB0zjPXbU9ctZFSvUo7nnVG99pRw@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Harry <simonsharry@gmail.com>, Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org



Am 12.08.21 um 03:37 schrieb Harry:
> On Thu, Aug 12, 2021 at 2:39 AM Florian Westphal <fw@strlen.de> wrote:
>>
>> Harry <simonsharry@gmail.com> wrote:
>>
>>> On Wed, Aug 11, 2021 at 7:59 PM Florian Westphal <fw@strlen.de> wrote:
>>
>>> I guess, my confusion is: Even if routing happens before OUTPUT, why
>>> in the Netfilter Packet Flow diagram above there is no arrow going to
>>> mangle:INPUT *also* apart from the raw:OUTPUT arrow already shown in
>>> the diagram?
>>
>> Because packets never move directly from OUTPUT to INPUT.
>>> packet is out on the wire!
> 
> In the current diagrams and explanations -- obviously yes!
> 
> I guess, the gist or the spirit of my original question was (and still
> is): It would've been more consistent and logical, and /more 'elegant'
> to have had Netfilter make the packet go through the same chains
> (either INPUT or FORWARD) once the (very first) routing decision has
> been taken on it.

again: it's no INPUT when you talk to a foreign machine
again: it's no FORWARD when you are not a router

when you are talking to 127.0.0.1 *it is* INPUT on "lo" and it can be 
filtered, my webservers can't talk to samba on the same machine

when you talk to other machines with locally-generated packets it's for 
the sake of god OUTPUT
