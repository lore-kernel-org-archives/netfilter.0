From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 19:56:40 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021025640.1206.qmail@web40210.mail.yahoo.com>
References: <3F949B21.1020804@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F949B21.1020804@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, netfilter@lists.netfilter.org

Some quick math show that roughly 80% of your total traffic is trappedby that
rule. Ouch! Also, do you really want your default policy to beaccept? It looks
like you had 736 Mbytes go to some other (unknown?)destination on your firewall
box.

Jeff 

You know I had never noticed that. I rely on my rule  and statematching to DROP
connecctions I do not want. It may be possible that some of the protocols I
have not accounted for are coming through?

What do you thaink guys? And thanks Jeff for pointing that out!

SBlaze.

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

