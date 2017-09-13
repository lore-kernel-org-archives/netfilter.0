From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 16:32:54 +0200
Message-ID: <CAOkSjBix=CoWwDG0+mUVDRu3NQ656U7g=+ZN23hJyVWzk_d26w@mail.gmail.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
 <DF1B4985-ED4C-4881-8A54-11310C5AA3B9@creamfinance.com> <CAOkSjBhPTEgftg7eOV2sRY-j0vRCjMF3W7-UwTTUW36nnp524Q@mail.gmail.com>
 <E6E3CCA0-6980-4008-A38D-9E8675590941@creamfinance.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E6E3CCA0-6980-4008-A38D-9E8675590941@creamfinance.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Rosenstein <thomas.rosenstein@creamfinance.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 13 September 2017 at 16:14, Thomas Rosenstein
<thomas.rosenstein@creamfinance.com> wrote:
>>
>> Please, avoid top-posting, thanks :-)
>>
>> There is information about debugging in the wiki [0], and is rather easy
>> to use.
>>
>> [0]
>> https://wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tracing
>
>
> Okay :)
>
> I added all the debug logs I can think of:
>
> table ip filter {
>         chain filter-prerouting-0 {
>                 type filter hook prerouting priority 0; policy accept;
>                 ip protocol icmp nftrace set 1
>         }
>
>         chain test2 {
>             type filter hook forward priority 0; policy accept;
>             ip protocol icmp nftrace set 1
>         }
>
>         chain test-200 {
>             type filter hook prerouting priority 200; policy accept;
>             ip protocol icmp nftrace set 1
>         }
>
>         chain test-m500 {
>             type nat hook prerouting priority -500; policy accept;
>             ip protocol icmp nftrace set 1
>         }
>
>         chain test-500 {
>             type filter hook prerouting priority 500; policy accept;
>             ip protocol icmp nftrace set 1
>         }
>
>         chain forward-0 {
>             type filter hook forward priority 0; policy accept;
>             ip protocol icmp nftrace set 1
>         }
>
>         chain forward-m500 {
>                 type filter hook forward priority -500; policy accept;
>             ip protocol icmp nftrace set 1
>         }
> }
>
> and the packets go missing between test-500 and forward-m500 also the
> test-m500 chain is never hit (nat).
>

beware that NAT-type chains only see first packet of flows [0].

In the ruleset I see a rather complex mixture of hooks/priorities.
I would recommend to not use such a complex scheme unless you really
know what you are doing.
Better to simply configure a ruleset scheme similar to what is
included in iptables, using same hooks/priorities as described in the
docs [0].

We follow a different approach in nftables than in iptables. In
iptables, all comes pre-configured, which is easier
but may force you to have things you don't use. In nftables all is
open-configured, which could be a bit more complex
if you don't try to simplify.

[0] https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains
