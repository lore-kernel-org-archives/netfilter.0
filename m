From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Sat, 8 Jan 2005 07:12:21 -0500
Message-ID: <00ac01c4f57b$4e0ddb50$3e0010ac@esonet18>
References: <7C9884991ADAE0479C14F10C858BCDF591E3AC@alderaan.smgtec.com><005101c4f504$7be50f20$3e0010ac@esonet18><20050107221822.GA1569@bender.817west.com><006901c4f51a$b259a230$3e0010ac@esonet18><1105149657.3501.2.camel@hubcap.ljm.dom><00a701c4f535$a9415740$3e0010ac@esonet18>
	<1105157748.3501.7.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

You have been a tremendous help. Thank you for helping me eliminate part of 
the mystery.

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 11:15 PM
Subject: Re: transparent bridge troubles?


> On Fri, 2005-01-07 at 22:53, mdpeters wrote:
>> Yes it did. Packets are flowing through with ACCEPT. So it is a problem 
>> with
>> QUEUE or something wrong with Snort-inline right?
>>
>> Snort-inline runs, and logs packets coming into the box but obviously the
>> packets are not making it through.
>
> since snort-inline is seeing the packets--i would say that the QUEUE
> part is working.  the fact the the packets don't make it out of the box
> would point the finger towards a snort-inline problem.
>
> unfortunately--i don't know a thing about snort-inline; so i'm not of
> much use anymore.
>
> -j
>
> --
> "Call this an unfair generalization if you must, but old people are
> no good at everything."
> --The Simpsons
>
>
> 


