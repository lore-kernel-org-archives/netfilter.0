From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ip redirection and multiport noobish question
Date: Mon, 27 Mar 2006 22:08:27 +0200
Message-ID: <003001c651da$364c7aa0$0101000a@sterenborg.info>
References: <52837e3e0603271157p80fbb87g154345f50735c4c4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52837e3e0603271157p80fbb87g154345f50735c4c4@mail.gmail.com>
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

> first i want to thank the replys for my first post!
> i want to do another route now
> 
> anypc --> webserver1 --- (router) --> webserver2
> 
> ip webserver1 = a.a.a.a (worldwide)
> ip router = b.b.b.b (router)
> ip webserver2 = c.c.c.c (intranet)
> 
> webserver1 uses APIs running on webserver2.
> 
> people over the internet should be able to see the contents of
> webserver2 which is on the local network
> 
> how can i route this?

Perhaps you should read Oskars Iptables tutorial first... Forwarding is
covered in detail.
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

What API does webserver1 use from webserver2 ? What protocol is it using
to do that ? Is webserver1 running on the router ?


Gr,
Rob


