From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 21:18:49 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006222115050.3363@obet.zrqbmnf.qr>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Effenberger <floeff@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-06-22 20:30, Florian Effenberger wrote:

>Hi Jan,
>
>thanks for the fast reply!
>
>Am 22.06.2010 um 20:19 schrieb Jan Engelhardt:
>
>> So create another chain. The in-memory table does not know DNS, and 
>> rightfully so.
>
>what does another chain help?

That you can independently refill the extra chain without having
to touch other rules. That is to say,

forall (addrs) {
	add_new_addrs to chain;
	++i;
}
while (delete rules from chain with an index #i does not throw an error)
	;

That gets harder when you have extra rules in the chain you are 
manipulating.

Alternatively, you could issue the delete operation with i+10
to keep the previous addresses around - and let them die off
by this pseudo-LRU mechanism.

>I need to keep some records in the tables, because of clients that 
>might have still the "old" address in their cache. The tables get 
>cluttered anyways, no matter if I use one or several user-defined 
>chains.
