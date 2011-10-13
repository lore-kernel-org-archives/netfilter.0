From: Victor Julien <lists@inliniac.net>
Subject: Re: nfqueue stuck on queue length >299
Date: Thu, 13 Oct 2011 12:50:31 +0200
Message-ID: <4E96C277.30002@inliniac.net>
References: <20111013132706.59fb7006@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111013132706.59fb7006@wwwwww-701SD>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: abirvalg@lavabit.com
Cc: netfilter@vger.kernel.org

On 10/13/2011 03:27 PM, abirvalg@lavabit.com wrote:
> On 10/13/2011 02:29 PM, abirvalg@lavabit.com wrote:
>> In my app one thread sends packets to NFQUEUE and another thread processes that \
>> NFQUEUE at the rate of 10 packets per second. I watch the state of NFQUEUEs using \
>> watch -n 1 'cat /proc/netnetfilter/nfnetlink_queue' I noticed that if I \
>> nfq_set_queue_maxlen to 299, then when the queue fills up to 299 (3rd column), the \
>> overflow gets dropped. As soon as new packets cease to arrive, dequeuing begins at \
>> the rate of 10 per second until the 3rd columnn reaches 0. All as expected. 
>> But as soon as I set NFQUEUE maxlen to 300, the following happens - the overflow \
>> gets dropped; but when I stop generating new packets, no dequeuing is taking place, \
>> the 3rd column seems to be stuck on 299 and from then on packets for that NFQUEUE \
>> don't get queued anymore but are dropped instead. The NFQUEUE still processes \
>> packets at the rate of 10 per second, but instead of queuing the overflow, it \
>> simply drops it. 
>> Is this a bug or a feature? Sure seems like a bug to me.
> 
>> Are you using some form of lock (like a mutex) to protect your nfq
>> calls? In my experience you need those.
> 
> Thank you for you suggestion. It didn't work, alhough I held my breath for a second.
> I inserted
> pthread_mutex_lock ( &nfqrepeat_mutex ) 
> at the start of the queue handler and
> pthread_mutex_unlock ( &nfqrepeat_mutex )
> right before return 0;
> This time around the 3rd column did overcome the vicious 299 figure but stuck on 359 and exhibited the same begaviour as I described above when it would get stuck on 299.
> 
> Some kind of voodoo going on?

Did you protect the verdict call by the same mutex? Thats what we do in
suricata.

-- 
---------------------------------------------
Victor Julien
http://www.inliniac.net/
PGP: http://www.inliniac.net/victorjulien.asc
---------------------------------------------

