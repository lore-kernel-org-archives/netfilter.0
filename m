From: seberino@spawar.navy.mil
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag setalways...
Date: Sat, 9 Apr 2005 20:23:08 -0700
Message-ID: <20050410032308.GA20000@spawar.navy.mil>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
	<20050408205224.GA15635@vetz.homelinux.org>
	<006901c53c7e$2ead1c90$f5001eac@riverview.office>
	<20050409062431.GA17505@spawar.navy.mil>
	<42582017.5030402@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42582017.5030402@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

> When the faster sending site sends it's packets to the slower
  receiving
> site the packets that are sent (1234, 1235, 1236, 1237...) will all
  have
> the same Acknowledgment number set in their packet stating that the
  next
> packet the faster sender receives from the slower client should be
  that
> Sequence number.

Grant

Wow!  Thanks again.  You cleared up the last missing piece about ACKs!
So the slow side can ACK multiple sequence numbers with a single
packet.  Likewise, the /fast/ side can send multiple ACKs for
the same repetitive sequence number.  That makes perfect sense.

Now I believe that TCP packets can all have ACKs set on an
ESTABLISHED connection.

Chris

P.S. BTW, I'm curious how you knew this level of great info.  Did you
carefully read through RFC 793?  That was jam packed with info but
hard to digest fully.

