From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: real-time monitor question
Date: Wed, 6 Aug 2003 16:48:52 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308061641140.21531-100000@localhost>
References: <04b001c35c32$436a5c70$0b02a8c0@pointhere.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04b001c35c32$436a5c70$0b02a8c0@pointhere.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jeffrey D. Brower" <jeff@pointhere.net>
Cc: netfilter@lists.netfilter.org

Hi Jeffrey,

> Let me be sure I understand all my input from the list:  (1) By setting the
> O_NONBLOCK option on my end of the pipe

By the way, you would have both ends of this particular pipe, since its 
purpose is to isolate the part of your application which reads from 
Netfilter, from the part which writes to the display. It may not even be 
necessary since, as you say:

> all I would loose would be the information on the packets that hit while
> the pipe is full

Yes, I believe so.

> (2) but the packets that hit while the pipe was full would process
> correctly anyway

Yes, it's my understanding that with the ULOG target, unlike QUEUE, 
Netfilter will not wait for your application, or even care what it does, 
as far as the processing of the packet which hit the ULOG target is 
concerned.

> (3) the input process can block and the output process nonblock so that
> the packet filter can run full speed and I can potentially not miss
> anything since the input side blocks and give me more time.

Yes, that's right.

> Do you know if ULOG can send an entry once a second with a summary of # of
> packets that hit rules which would give me fewer reads on the pipe?

As far as I know, it cannot.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


