From: Frank Gruellich <frank@der-frank.org>
Subject: Re: TOS benefits
Date: Tue, 10 Aug 2004 12:50:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040810105020.GM1067@der-frank.org>
References: <a0f69e5040809114644633ce4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a0f69e5040809114644633ce4@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

* Askar Ali Khan <askarali@gmail.com> 10. Aug 04:
> hi all,

Hello,

> [snip] I just want to know im doing the below on our company firewall,
> that Type of Service bit things.  My question is that
> 1) Is this beneficial for protocol like MSN and yahoo?

You should ask you ISP.  It's a question to the routers between you and
the servers you connect to.  They have to look at the TOS-field and make
their routing-decision depend on this.  It could be used in some kind of
QoS to decide how to queue pakets.  From my experience most routers
ignore the TOS, but take a closer look to the amount of money the
customer pays and route in a linear dependence to this.  (YMMV)

HTH,
 regards, Frank.
-- 
Sigmentation fault

