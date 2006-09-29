From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Fri, 29 Sep 2006 08:15:03 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609290813080.30682@yvahk01.tjqt.qr>
References: <451B0E63.3010806@gmx.de>
	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
	<451B9794.9090209@gmx.de> <451BBD3D.40305@eternet.cc>
	<Pine.LNX.4.61.0609281430270.26317@yvahk01.tjqt.qr>
	<451BF2CA.5060001@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451BF2CA.5060001@gmx.de>
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


>> You have to mark it in the PREROUTING chain of the mangle table, to be 
>> able to match on it within the PREROUTING chain of the nat table.
>
>Is this also true, if I jump from PREROUTING mangle in a user
>defined chain and mark my packets there?

Just make sure it gets marked in a table/chain (or subchain thereof) 
before the nat-PREROUTING chain is hit, according to 
http://www.imagestream.com/~josh/PacketFlow-new.png


Jan Engelhardt
-- 

