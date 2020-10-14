From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 12:02:08 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2010141148070.28273@piplus.local.jubileegroup.co.uk>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com> <20201014100402.GA19556@salvia> <alpine.DEB.2.23.453.2010141221380.6472@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.23.453.2010141221380.6472@localhost>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi there,

On Wed, 14 Oct 2020, Jozsef Kadlecsik wrote:
> On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:
>
>> On Wed, Oct 14, 2020 at 04:16:40AM +0000, Ramsay, Lincoln wrote:
>>> Hi,
>>>
>>> I've just confirmed that I can't make a rule that matches ct status != dnat.
>>
>> ct status == dnat and ct state != dnat checks for _exact_ matching.
>>
>> Then:
>>
>>         ct status dnat
>>
>> based on the datatype, provides a shortcut for
>>
>>         ct status and dnat == dnat
>
> Sorry, but it looks like really strange. ...

+1

On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:

> For inverted matching, please use:
>
>        ct status and dnat != dnat
>

If you will forgive me some pseudocode, I'd interpret that as

!(ct.status & dnat)

and deduce

(1) that 'ct status' is some sort of atom and

(2) _either_ that '!=' has a lower precedence than 'and' _or_ that we
must always assume left-to-right evaluation of the expression.

Would any of that be right?

After years of little more than occasionally looking at netfilter
expressions, and despite having read the Wiki, the main things which
still confuse me are what must be spelt out in full and what can be
abbreviated, what will be associated with what, and where to put any
(notional) parentheses when reading it.

I don't know how I would ever have come up with Pablo's version of the
expression.  I find the syntax quite bewildering.  Is there a way to
write expressions for netfilter like my pseudocode, even if it's more
verbose?  Even if the alternative were *much* more verbose, as long as
it looked something like the other things that I've been writing for
nearly fifty years I'd find it much easier to understand.

-- 

73,
Ged.
