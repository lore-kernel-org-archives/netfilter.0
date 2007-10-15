From: Robby Workman <rw@rlworkman.net>
Subject: Re: [ANNOUNCE] Release of iptables 1.4.0rc1
Date: Mon, 15 Oct 2007 16:35:54 -0500
Message-ID: <4713DD3A.3040201@rlworkman.net>
References: <47139AD0.8060002@netfilter.org> <slrnfh7f7l.crr.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrnfh7f7l.crr.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org

Petr Pisar wrote:
> On 2007-10-15, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> The netfilter coreteam proudly presents:
>>
>> 	iptables version 1.4.0rc1
>>
> Great to hear it. But it doesn't build ip6tables-{save,restore} as older
> versions either. The problem is that these two makefile targets are in
> *_EXP veriable.
> 
> It is bug or a feature?


If I remember correctly (and I may not), the iptables-{save,restore}
were marked as experimental earlier, then at some point they were
not.  As of 1.3.8, iptables-{save,restore} are not experimental,
while ip6tables-{save,restore} are.  I would expect that they will
have the same fate sooner or later.  In the meantime, if you want
them, just use make experimental and make install-experimental
to get them...

-RW

-- 

http://rlworkman.net
