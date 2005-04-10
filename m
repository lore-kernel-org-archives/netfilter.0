From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag setalways...
Date: Sun, 10 Apr 2005 00:09:55 -0500
Message-ID: <4258B523.9070902@riverviewtech.net>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
	<20050408205224.GA15635@vetz.homelinux.org>
	<006901c53c7e$2ead1c90$f5001eac@riverview.office>
	<20050409062431.GA17505@spawar.navy.mil>
	<42582017.5030402@riverviewtech.net>
	<20050410032308.GA20000@spawar.navy.mil>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050410032308.GA20000@spawar.navy.mil>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

> Grant
> 
> Wow!  Thanks again.  You cleared up the last missing piece about ACKs!
> So the slow side can ACK multiple sequence numbers with a single
> packet.  Likewise, the /fast/ side can send multiple ACKs for
> the same repetitive sequence number.  That makes perfect sense.
> 
> Now I believe that TCP packets can all have ACKs set on an
> ESTABLISHED connection.
> 
> Chris
> 
> P.S. BTW, I'm curious how you knew this level of great info.  Did you
> carefully read through RFC 793?  That was jam packed with info but
> hard to digest fully.

No, I cant say as I recall reading RFC 793 in particular, though I do read a LOT of RFC pertaining to what I do, I'm a systems administrator / consultant, so I need to know a lot about email (SMTP), DNS, www (HTTP), etc.  I spend a lot of time helping others get their system up to speck thus I've run across a lot of not quite up to spec but close enough to work *most* of the time.  I get called when it does not.  If ever I run across things that I don't know about (and it happens more than you might think) I turn to RFC, Google (this is a REALLY BIG ONE), and peers in the industry on mail lists like this one.  It's not what you know, it's who you know to ask.  :)



Grant. . . .

