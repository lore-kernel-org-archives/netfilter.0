From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Thu, 30 Apr 2020 13:25:33 +1000
Message-ID: <87ees5wt76.fsf@goll.lan>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
        <87blnkqg1j.fsf@goll.lan>
        <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
        <20200423020613.GE30155@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Duncan Roe <duncan_roe@optusnet.com.au> writes:

> On Wed, Apr 22, 2020 at 12:34:26PM -0400, Martin Gignac wrote:
>> > You can simply put "list ruleset" at the bottom of the foo.nft file.
>> > However in my experience this routinely gives outright wrong rulesets
>> > (as at nftables 0.9.1), so I don't trust it.
>
> "list ruleset" at the bottom of an nft script is completely accurate.
> The command "nft list ruleset" discards portions of rules that are implicit, in the
> interests of brevity.

Sorry, I don't have a testable example.

My rulesets were like this:

    flush ruleset
    <stuff here>
    list ruleset

I *think* I saw the output of "nft -f test.nft" had entire rules
missing, where they were present in "nft list ruleset" immediately
afterwards.

I just tried to reproduce this and couldn't, so it's possible I was just
really tired and the real problem was inside my brain!

I would have understood e.g. ct state keywords being XORed to a number, but
it's possible I was seeing ELEMENTS in a list/mapping "disappear"
because they were being merged (e.g. below) and then mis-remembering
that as "rules disappear".

If I run into this again, I'll try to keep proper records so I can file
a proper bug report!

    root@not-omega:/home/twb# nft -f tmp.nft >before
    root@not-omega:/home/twb# nft list ruleset >after
    root@not-omega:/home/twb# GIT_PAGER=cat git diff -U999 before after
    diff --git a/before b/after
    index dc38326..ad39c3a 100644
    --- a/before
    +++ b/after
    @@ -1,28 +1,27 @@
     table inet my_filter {
            map ICMPv6_RFC4890_policy {
                    type icmpv6_type : verdict
                    flags interval
    -               elements = { 0,
    -                            destination-unreachable : accept,
    -                            5 : drop,
    -                            100 : drop,
    -                            102 : drop,
    +               elements = { 1-4 : accept,
    +                            5-99 : drop,
    +                            100-101 : drop,
    +                            102-126 : drop,
                                 127 : drop,
    -                            echo-request : accept,
    -                            mld-listener-query : accept,
    -                            nd-router-solicit : accept,
    +                            128-129 : accept,
    +                            130-132 : accept,
    +                            133-136 : accept,
                                 nd-redirect : drop,
                                 router-renumbering : drop,
    -                            139 : drop,
    -                            ind-neighbor-solicit : accept,
    +                            139-140 : drop,
    +                            141-142 : accept,
                                 mld2-listener-report : accept,
    -                            144 : accept,
    -                            148 : accept,
    +                            144-147 : accept,
    +                            148-149 : accept,
                                 150 : drop,
    -                            151 : accept,
    -                            154 : drop,
    -                            200 : drop,
    -                            202 : drop,
    +                            151-153 : accept,
    +                            154-199 : drop,
    +                            200-201 : drop,
    +                            202-254 : drop,
                                 255 : drop }
            }
     }

