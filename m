From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 22:53:49 -0500
Message-ID: <00a701c4f535$a9415740$3e0010ac@esonet18>
References: <7C9884991ADAE0479C14F10C858BCDF591E3AC@alderaan.smgtec.com><005101c4f504$7be50f20$3e0010ac@esonet18><20050107221822.GA1569@bender.817west.com><006901c4f51a$b259a230$3e0010ac@esonet18>
	<1105149657.3501.2.camel@hubcap.ljm.dom>
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

Yes it did. Packets are flowing through with ACCEPT. So it is a problem with 
QUEUE or something wrong with Snort-inline right?

Snort-inline runs, and logs packets coming into the box but obviously the 
packets are not making it through.

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 9:00 PM
Subject: Re: transparent bridge troubles?


> On Fri, 2005-01-07 at 19:40, mdpeters wrote:
>> Well I did this and I guess I have a firewall problem which I guess is 
>> the
>> good news and the right user group.
>
> good--we're narrowing things down.  now--do we have a firewall problem,
> or a snort-inline problem?
>
> can you humor me, and change all your "-j QUEUE" to "-j ACCEPT" and see
> if that makes any difference?
>
> -j
>
> --
> "I bet Einstein turned himself all sorts of colors before he invented
> the light bulb."
> --The Simpsons
>
>
> 


