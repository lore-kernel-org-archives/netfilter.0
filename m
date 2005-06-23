From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Thu, 23 Jun 2005 13:01:43 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506231300530.26133@yvahk01.tjqt.qr>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
	<42B9C979.9080701@riverviewtech.net>
	<Pine.NEB.4.62.0506222034050.9177@ukato.freeshell.org>
	<Pine.LNX.4.60.0506221645490.22256@darkstar.sysinfo.com>
	<Pine.NEB.4.62.0506222110120.10040@ukato.freeshell.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.NEB.4.62.0506222110120.10040@ukato.freeshell.org>
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
To: Alexey Toptygin <alexeyt@freeshell.org>
Cc: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

> I think all modern implementations will always send ACK on an established
> connection, but I don't think RFC793 requires it. Therefore, it may be safe to
> drop unflagged packets, but it seems like a bad idea to me.

ACK on everything? That does not sound right.

When I call send(fd, ..., "some message"), I'd expect

  - a non-ack packet from me->remote
  - an ack packet from remote



Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

