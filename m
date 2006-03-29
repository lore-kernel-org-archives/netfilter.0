From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Where is ip6tables?
Date: Wed, 29 Mar 2006 16:51:35 +0900 (JST)
Message-ID: <200603290751.k2T7paQO023351@toshiba.co.jp>
References: <859616420603280835rc24974dw@mail.gmail.com>
	<200603290715.k2T7FPrH011180@toshiba.co.jp>
	<859616420603282327u4eb9e96fi@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420603282327u4eb9e96fi@mail.gmail.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: beunlovable@gmail.com
Cc: netfilter@lists.netfilter.org

From: "David Vogt" <beunlovable@gmail.com>
Date: Wed, 29 Mar 2006 09:27:08 +0200

> > You can find iptables-ipv6-...rpm at
> >
> > http://download.fedora.redhat.com/pub/fedora/linux/core/updates/3/i386/
> >
> 
> Thanks, solved that. Now ip6_queue module is missing. There are
> various modules (e.g. ip6_tables) installed, however, the queue module
> is missing. Can I find additional modules in packages as well? I'm
> confused.

Sorry, I don't know about fedora package in detail. ip6_queue is kernel
module, then I think it is in package of kernel. Otherwise I have no idea
to get package including it.

-- Yasuyuki Kozakai

