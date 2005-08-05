From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Iptables is resetting
Date: Fri, 5 Aug 2005 08:28:45 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508050828230.20623@yvahk01.tjqt.qr>
References: <62ddd33050804075057697edb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <62ddd33050804075057697edb@mail.gmail.com>
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
To: Joseph Nicholson <wjnicholson@gmail.com>
Cc: netfilter@lists.netfilter.org


>I have been seeing an issue lately when using Iptables on a Fedora
>Core 3 box.  The version number is 1.2.11.  Some of my users have been
>complaining that sometimes the connection will stop working.  If I go

Maybe something is calling iptables -F spuriously?



Jan Engelhardt
-- 

