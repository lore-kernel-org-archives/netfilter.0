From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: netfilter Digest, Vol 9, Issue 12
Date: Thu, 7 Apr 2005 10:56:06 +0400
Message-ID: <9927912d05040623567adba676@mail.gmail.com>
References: <425453ee.52656c03.5f63.ffff9ee0SMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425453ee.52656c03.5f63.ffff9ee0SMTPIN_ADDED@mx.gmail.com>
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

Hi to all,

I wanted to know abt the following:

do we always have to set up ebtables as a bridge or bridge router to
be able to use ebtables commands. Is it possible to have only a normal
firewall using ebtables (just like with iptables). It's just that
almost all examples I've come across talk abt building only bridges,
bridgefirewalls or bridge routers. I just need a confirmation of this.

Also, I want to make the packets move from the link layer right after
ebtables NAT PREROUTING to iptables. I have not set up my PC as a
bridge or bridge router.. I just want to set up a normal firewall that
makes use of both ebtables and iptables.

How do i go about it? do i use br-nf code?Does anyone have any sample
script using br-nf code? If yes. pls send it to me.

Thx in advance..

Best regards,
Visham Ramsurrun

