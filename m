From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: SNAT or MASQ or both?
Date: Fri, 28 Apr 2006 00:37:15 +0200
Message-ID: <001901c66a4b$22a02590$0101000a@sterenborg.info>
References: <e606945b0604271350w5f4f93e1ke356a66657d01ffd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e606945b0604271350w5f4f93e1ke356a66657d01ffd@mail.gmail.com>
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

netfilter-bounces@lists.netfilter.org scribbled on Thursday, 27 April
2006 22:51:

> I'm creating a gateway that has dynamic addresses for most of the
> internal machines.  I'm using masquerading successfully but my
> question is this...i have some machines for which I want to use static
> internal addresses...do i need to setup an snat rule for these
> machines or is masquerading adequate?  A brief sentence in a how-to
> made me think maybe masquerading wasn't the right way to go for these
> machines...but i'm not sure. 

That's about *external* dynamic IP adresses, not internal.
User SNAT is you have a static external IP (and are not using a ppp
adapter for your internet connection, if I remember correctly).


Gr,
Rob


