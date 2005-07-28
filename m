From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: rc.local
Date: Thu, 28 Jul 2005 08:34:18 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507280830530.6616@yvahk01.tjqt.qr>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
	<9927912d0507260430275d8239@mail.gmail.com>
	<5d2f379105072608385caaee15@mail.gmail.com>
	<9927912d050726221615fe208f@mail.gmail.com>
	<5d2f37910507270942577f9173@mail.gmail.com>
	<9927912d0507272231571653e7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d0507272231571653e7@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Visham Ramsurrun <vishamr2000@gmail.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

>> > you are right..i'm having a scripting problem..i don't know how to
>> > make a script execute every time a packet is sent by my PC. how can i
>> > do that?
>> 
>> You don't want to execute a script for each packet... you could be
>> easily DoSed. Try:
>> 
>> http://netfilter.org/patch-o-matic/pom-base.html#pom-base-nth
>> Please reply to the list, so everyone can help and learn. =)
>
>No I only want to execute a script for all packets that are packets
>that are going to be sent out of the NIC (after the packets have been

That's still a DOS. If I pingflood you, your machine will most likely respond 
with "pongflood".

I have iptraf running for like 4 or 5 days now and it shows almost 11 GB 
which approximates to ~ 34 KB/sec (inet radio ;). Let's assume that every 
packet was 1500 bytes long - then this would mean that I would be starting 23 
processes per second, which really is inefficient.

And, you're looking for -j QUEUE.

>accepted as valid by a firewall). I don't know how to do that. Do you
>know what is the last function in the iptables code or the first
>function in the NIC driver, that a packet that has been accepted by
>the firewall passes before it is sent on the wire? I would then write
>some code so that when a call is made to that function, a signal is
>raised and it will cause a shell script to execute.
>I don't know abt the DoSed command. Do you have any example?
>
>If there is an easier way, please let me know...
>
>MAny thx for the reply.
>
>Warm regards,
>Visham
>
>

Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

