From: Luca Bedogni <bedogniluca-linux@yahoo.it>
Subject: Re: Routing packets via a C program
Date: Tue, 30 Jan 2007 17:14:10 +0100
Message-ID: <200701301714.10868.bedogniluca-linux@yahoo.it>
References: <200701220958.51794.bedogniluca-linux@yahoo.it>
	<Pine.LNX.4.61.0701271553330.22295@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701271553330.22295@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On Saturday 27 January 2007 15:55, Jan Engelhardt wrote:
> On Jan 22 2007 09:58, Luca Bedogni wrote:
> >Hi all
> >	i'm writing down a simple program for routing the packets manually. The
> >idea is: if a packet comes from a specific IP (192.168.0.2) I set
> > ip->saddr to my ip and then accept it. And, if a packets comes from the
> > outside, i set ip->daddr to 192.168.0.2 and then accept it. I recalculate
> > the checksum and it's correct (i can see that by printing out it).
>
> What for - are you trying some nifty SNAT/DNAT trick?

Yes, i want to monitor performances and such via normal routing and via 
userspace routing.

> >The basic problem is that, sniffing packets with wireshark, i can see the
> >packet from 192.168.0.2 to outside, but not mine to outside.
> >
> >I also tried with NF_REPEAT and NF_ACCEPT and NF_QUEUE when calling
> >ipq_set_verdict, but nothing changed..
>
> You should be fine by QUEUEing packets in PREROUTING (or at least somewhere
> before the <Routing Decision> in [PacketFlow]), modify them in your
> userspace program, reinject them, and have the <Routing Decision> do the
> right then.

Yes i basically do this, but the packets aren't reinjected. I change the IP 
and recalculate the checksum, but when calling ipq_set_verdict I can't see 
any packets on the wire :(
Any other hint?

> 	-`J'

Regards
-- 
Debian Powered GNU/Linux User #373118
Bedogni Luca - 	Blog | http://blog.lucabedogni.it
		        Site | http://www.lucabedogni.it
Debianizzati - www.debianizzati.org | Founder Member
--
Better paranoid than sorry

