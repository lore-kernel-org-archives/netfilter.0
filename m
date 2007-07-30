From: fd4 <fd4@itsec4u.de>
Subject: Re: delete conntrack entry - how
Date: Mon, 30 Jul 2007 16:12:18 +0200
Message-ID: <20070730161218.774be78b@alice.thum.ath.cx>
References: <46AB38AC.5050509@netfilter.org>
	<20070730133240.730c0ef4@alice.thum.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070730133240.730c0ef4@alice.thum.ath.cx>
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


> an example for deleteing such an entry within the man page would be fine

maybe this one (thanks to a readers help :-)
conntrack -D [conntrack] -s 172.16.31.31 -d 172.16.31.255 -p udp --orig-port-src 138 --orig-port-dst 138

