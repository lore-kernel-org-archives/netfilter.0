From: Thanos Panousis <pthanos@gmail.com>
Subject: Re: Packets from "self" dont pass through netfilter
Date: Thu, 12 Jan 2006 16:19:29 +0100
Message-ID: <4dcb3660601120719w550aa81r9c63431e72f575bc@mail.gmail.com>
References: <4dcb3660601110735o30468a40m87b7629d8b0e041d@mail.gmail.com>
	<43C6510B.3070203@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43C6510B.3070203@arcor.de>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Yes I understand that, but still I need some advice on how to make
that happen, cause its really vital for what I m trying to do.

How can I make the QUEUE target of netfilter receive packets as if it
was in "promiscuous" mode? to put it in another way, I would like the
QUEUE target to receive whatever shows up on ethereal (which is all
traffic on the hub).

Having both the the primary and the backup share the same IP/MAC, the
packets from the primary dont go up netfilter in the backup. How can I
make this happen, or at least "fake" something in the backup so that I
make it happen....


Thanks for your reply.


On 1/12/06, Markus Marquardt <adrock0501@arcor.de> wrote:
> Thanos Panousis wrote:
>
> > But the packets that come from the primary server(which has the same
> > IP/MAC) NEVER go in the backups QUEUE. Why is that?? I dont grab them
> > at the QUEUE target, but I can see them crossing if I use ethereal!
>
> IMHO the backup server thinks the packets came from itself (same MAC).
> So why should it queue them into the ip stack?
>
> Regards,
> Markus
>
>
>

