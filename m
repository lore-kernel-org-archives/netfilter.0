From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Thu, 30 Apr 2020 13:10:10 +1000
Message-ID: <87pnbpwtwt.fsf@goll.lan>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
        <87blnkqg1j.fsf@goll.lan>
        <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Martin Gignac <martin.gignac@gmail.com> writes:

> This is actually a very cool idea! I never realized that nftables
> rulesets are bound to a specific namespace, but now it makes perfect
> sense. The only "drawback" (I guess) is that I cannot use 'iif' for
> any other interface than 'lo' in the temp namespace; I'll need to use
> 'iifname' instead since the referenced interfaces won't exist in the
> temp namespace. But it's not a deal breaker.

You can create dummy interfaces with appropriate names inside your dummy
namespace.  Something like this (untested):

    ip -namespace delete-me link add name eth0 type dummy

