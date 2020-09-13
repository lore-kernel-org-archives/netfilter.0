From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: Filter based on string (or other content)
Date: Sun, 13 Sep 2020 09:49:44 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2009130918340.4722@piplus.local.jubileegroup.co.uk>
References: <d3356c66687003310366b87a69328d329074efcb.camel@neobits.nl> <20200913004552.GE15387@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200913004552.GE15387@dimstar.local.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Sun, 13 Sep 2020, Duncan Roe wrote:

> On Sat, Sep 12, 2020 at 03:41:00PM +0200, K. de Jong wrote:
>> I switched to nftables, but I miss one key feature. That is the ability
>> to filter packets based on a string.  ...
>> Does anyone know a solution to do this with nftables?
>
> I think I have done something like what you're after using 'queue' target and
> writing a netfilter-queue program. See https://github.com/duncan-roe/nfq

Looks like good work.

Shouldn't the TLDs be taken from the special use domains?

https://www.iana.org/assignments/special-use-domain-names/special-use-domain-names.xhtml

-- 

73,
Ged.
