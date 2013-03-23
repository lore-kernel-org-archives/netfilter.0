From: Ed W <lists@wildgooses.com>
Subject: Re: Need help with dialup connection (and syn packets)
Date: Sat, 23 Mar 2013 21:20:19 +0000
Message-ID: <514E1C93.9080500@wildgooses.com>
References: <514DD967.1080501@wildgooses.com> <CADGd2DrqjdgQ96xxCY+0jt-XjKFhZPceBUSGZSfgu704qcqVVg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADGd2DrqjdgQ96xxCY+0jt-XjKFhZPceBUSGZSfgu704qcqVVg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Lauro <johnalauro@gmail.com>
Cc: netfilter@vger.kernel.org

Connectivity costs $1.50/minute.  You pay for 20 second increments. 
Speed is 2.4kbits (20KB/min)

It's a dial on demand router for a satellite based system

Any other thoughts?  I'm obviously going to look at application specific 
proxies, but I guess I'm hoping that someone might put me on to some 
clever ideas to buffer packets or duplicate them with delay...

Thanks

Ed W


On 23/03/2013 21:11, John Lauro wrote:
> Sounds like the main problem is your aggressive hangup due to
> inactivity.  It should be at least 4 times as the connect time, not
> under half!.  I suggest 6 minutes, but at least 2 minutes.
>
> If you can't adjust that, probably the next best alternative is a
> pre-emptive ping or something to wake up the modem about 25 seconds
> before you want to connect, or just ping every 5 seconds until you get
> a successful response
>
> On Sat, Mar 23, 2013 at 12:33 PM, Ed W <lists@wildgooses.com> wrote:
>> Hi, I have a dialup connection (yes they still exist) and PPP with demand
>> dial.  I have a problem with the exponential backoff sending new SYN packets
>> when creating a new tcp connection. The problem is that the dialup
>> connection takes around 23 seconds to complete (and then hangs up 10 seconds
>> later due to inactivitity), but by then the gaps between SYN packets is very
>> long...
>>
>> Unfortunately most operating systems send an initial SYN, then exponentially
>> backoff with intermittent resends, say after 1 sec, 2 secs, 4 secs, 8 secs,
>> 16 secs, etc.  So what we observe is that because the dialup connection
>> takes so long to complete, by then the tcp connection is only trying quite
>> intermittently to connect, eg you might well wait another 8+ seconds before
>> the next syn is resent, quite easily my demand dial connection will hangup
>> before the retransmit is even fired...
>>
>> Does anyone have any suggestions on how I might fake this a little? I
>> effectively desire to simulate buffering syn packets before the PPP
>> connection comes up?
>>
>> Thanks for any off the wall thoughts...
>>
>> Ed W
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

