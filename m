From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: routing mail on a different gateway
Date: Fri, 23 Jul 2004 15:54:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <TBEXEDU01BBsQwY6YHk00000046@smtp.maurickcollege.nl>
References: <41010B14.7000206@tri-oxyde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41010B14.7000206@tri-oxyde.org>
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
To: netfilter@lists.netfilter.org

> > Maybe this will do ; use ppp+ instead of ppp0 or ppp1.
> > ppp+ matches any ppp.

> Where should I use it ? iproute2 doesn't understand ppp+

Sorry, I thought you were using netfilter to match an interface...
Netfilter/iptables does understand it.


Gr,
Rob



