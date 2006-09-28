From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 12:55:24 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609281253020.30351@yvahk01.tjqt.qr>
References: <451B0E63.3010806@gmx.de>
	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
	<451B9794.9090209@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451B9794.9090209@gmx.de>
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
To: Clemens <clemens.schaefer@gmx.de>
Cc: netfilter@lists.netfilter.org


>> What marks, per-packet marks or per-connection marks?
>> 
>I am not sure, how to distinguish, I just mark all pakets that pass

-j MARK => per-packet
-j CONNMARK => per-connection

>through a certain user defined chain. I guess this is a mark per packet.
>The particular chain lookes like this:
>
>
>Chain FWD_WWW-101 (2 references)
>target     prot opt source               destination
>ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
>100000000 bytes
>MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
>set 0x65
>ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
>1000000 bytes
>MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
>set 0x1

MARK is only allowed in the mangle table.

>
>
>The goal is to provide full network speed for all NATed computers
>for a certain amount of bytes (first quota match), then mark their
>packets individually (each computer has its own mangle chain
>(FWD_WWW-$computernumber)) with its computernumber in hex, so tc can
>slow down their connection to 56k and after the "slow quota" is used
>up, the users packets get a different mark  (mark 1) and get a DNAT
>to an Over Quota webpage, when the user tries to access an outside
>webpage, other connectionattempts get droped.
>
>
>The problem is now, that pakets get marked with the mark 0x1, but in
>PREROUTING nat table, this mark never appears.

http://www.imagestream.com/~josh/PacketFlow.png

PREROUTING comes before FORWARD.

>
>Thanks, Clemens
>
>

Jan Engelhardt
-- 

