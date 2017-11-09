From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: [Fwd: How to enable Xen VM traffic using nft]
Date: Thu, 9 Nov 2017 12:51:44 +0100
Message-ID: <CAOkSjBhTxijtCRh7PK=Pw_RYwPOnbY2ZeeQP7DhEoRoWYWEtRQ@mail.gmail.com>
References: <1509137741.13003.0.camel@cefetmg.br> <1510179317.5175.1.camel@cefetmg.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1510179317.5175.1.camel@cefetmg.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Bruno <leonardo@cefetmg.br>
Cc: netfilter <netfilter@vger.kernel.org>

On 8 November 2017 at 23:15, Leonardo Bruno <leonardo@cefetmg.br> wrote:
> Hi guys.
>
> Any clue on this subject?
>
> Hope someone can help.
>

Try using nftables in the bridge family.

I see we lack some information here so I added a new wiki page:

https://wiki.nftables.org/wiki-nftables/index.php/Nftables_families
