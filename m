From: Chris Hall <nftables@gmch.uk>
Subject: 'meta mark' and 'meta mark set' -- any restrictions on their use ?
Date: Tue, 15 Sep 2020 16:43:30 +0100
Message-ID: <77ceecee-92a6-b262-881c-9428d1bc5fac@gmch.uk>
References: <S1728814AbgIBQSI/20200902161835Z+839@vger.kernel.org>
 <4c39e878-8c4d-24a8-543e-206e1ca0a458@gmch.uk> <20200902175133.GA5283@salvia>
 <ae5d9b55-b77d-0a1e-d236-be67eb9333ce@gmch.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ae5d9b55-b77d-0a1e-d236-be67eb9333ce@gmch.uk>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Can anyone point me in the direction of some documentation that tells me 
how my ruleset may use the 'meta mark' ?

I assume that nothing in the kernel and nothing in nftables itself 
depends on the value of the 'mark' ?  So I may make whatever use I like 
of it in my ruleset ?

I gather that the initial value of the mark may be set by the ConnTrack 
stuff, if the connection is not new and 'ct mark set <value>' has been 
used.  Is that true ?

I guess the default value for the mark is 0.  Is that true ?

I gather that I may

   add rule ... meta mark set xx

in order to set the mark, and later I can:

   add rule meta mark yy ...

to do something if the mark is equal to yy.

Or:

   add rule (meta mark yy & 0x11) != 0 ...

to do something if yy contains either of the bits in 0x11.

I assume I have understood correctly ?

Experiment also suggests that I may:

   add rule ... meta mark set (meta mark | 0x100)

to modify the mark.  I assume that is meant to work ?  (I note that the 
second 'meta' appears to be redundant.)

There is clearly a quite sophisticated <expression> syntax layered on 
top of what the man-page calls a "Primary Expression" (and the terms 
<expr> in 'define <variable> = <expr>' and <value> in 'meta mark set 
<value>' and elsewhere).  Can anyone point me in the direction of the 
documentation for all this ?

Thanks,

Chris
