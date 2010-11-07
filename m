From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue exiting on big tcp sessions
Date: Sun, 07 Nov 2010 21:44:59 +0100
Message-ID: <4CD70FCB.3050800@netfilter.org>
References: <AANLkTimmr4MVCOwgxea9KoGB1BjomBchJ7oAgpnt2WyZ@mail.gmail.com> <4CD1AB54.5080603@netfilter.org> <4CD3E5DB.2000704@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CD3E5DB.2000704@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org, Mistick Levi <gmistick@gmail.com>

On 05/11/10 12:09, Alessandro Vesely wrote:
> On 03/Nov/10 19:35, Pablo Neira Ayuso wrote:
>> On 02/11/10 16:46, Rajkumar S wrote:
>>>  I am using utils/nfqnl_test.c as my test program
>>
>> Please, see:
>>
>> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commitdiff;h=37791b0eb98c00098a6410f6dedfdce92fc88f3e;hp=c4692e02d4fc804f7aa31f407d7d2f31861753bc
> 
> Thanks for the improved docs!
> 
> For older kernels, would it also help setting something like
> -A INPUT -m limit --limit 10/second -j NFQUEUE --queue-num 0?

I don't want to add that in the docs, sorry. It looks more like a crafty
workaround.

> Would you please also amend nfqnl_test.c?  From this thread I grasp that
> packets that overflowed the queue are still received/ transmitted, but
> am unable to do better than the attached (untested) patch.

I have pushed the following patch, it's based on yours (i have however
respected your credits).

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commit;h=a10a4d9291181a142ff85b0db8f2907cd05b978f

Mistick Levi sent a similar patch in the same timeline, btw.
