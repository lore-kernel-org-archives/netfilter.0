From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 15:34:16 +0200
Message-ID: <CAOkSjBhPTEgftg7eOV2sRY-j0vRCjMF3W7-UwTTUW36nnp524Q@mail.gmail.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com> <DF1B4985-ED4C-4881-8A54-11310C5AA3B9@creamfinance.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DF1B4985-ED4C-4881-8A54-11310C5AA3B9@creamfinance.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Rosenstein <thomas.rosenstein@creamfinance.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 13 September 2017 at 15:23, Thomas Rosenstein
<thomas.rosenstein@creamfinance.com> wrote:
> Hi,
>
> it is now working and my router receives the return packets, but they are
> not forwarded and dropped after the MANGLE PREROUTING chain.
>
> What could be the issue, or where in the kernel could I check what's
> happening? Is there some flag to enable detailed tracing?
>
> Based on tcpdump the packet is okay regarding checksums.
> Based on this
> https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
> it breaks somwhere between mangle and nat PREROUTING.
>
> Any suggestions or ideas are welcome!

Please, avoid top-posting, thanks :-)

There is information about debugging in the wiki [0], and is rather easy to use.

[0] https://wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tracing
