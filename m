From: "hard__ware" <hard__ware@hotmail.com>
Subject: Completely NAT an ISP: A practical possibility?
Date: Sun, 16 Jun 2002 09:47:19 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <OE765XsCj1d4vJFRFWM00002445@hotmail.com>
Reply-To: "hard__ware" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Completely NAT an ISP: A practical possibility?


>Antony Stone wrote:

> > Just out of interest, how are you proposing to handle bandwidth
allocation -
> > making sure each customer gets a reasonable bandwidth without hogging
the
> >whole link ?


>(Ducking) Still studying that matter, but the current
>candidates-of-record are tc, and cbq, but the Advanced Routing HOWTO is
>about to scare me off from CBQ, even though they admit there that it is
>the "most hyped."
>
>I won't mind any advice in that arena, either :-)
>
>Thx.


A CBQ and a few SFQ limits will do this perfectly
as you can match by IP / Protocol / Headers / (Actual Data Contained inside
of each Packet / Frame )
and ToS fw Marks .. :D

And about the NAT / ISP thing , i think it would be great to do someting
like that .. :D
i so hate peer-to-peer sharing over the internet ... lol

what kind of ISP is it going to be dialup , ISDN ??

because Radius & Portslave (Linux Dialin Server) will allow you to restict
Bandwidth per client ...
let me know how you go, as i have a Buisness Partner that plans to build a
NAT / IPTables ISP
so we can give these Buisness Based Clients exactlly what they want .. :D

  hope this helps

    Alex...

Hard__warE




