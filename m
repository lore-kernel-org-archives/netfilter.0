From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: routing mail on a different gateway
Date: Fri, 23 Jul 2004 14:50:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <TBEXEDU010ZJPIad6z000000042@smtp.maurickcollege.nl>
References: <41010585.3020703@tri-oxyde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41010585.3020703@tri-oxyde.org>
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

> But the problem is that there are originated from 
> 62.212.120.196, which is the ip of ppp0, not ppp1. So packets 
> can't take the way back.
> 
> How can I change the "from" ip of packets that are routed 
> through ppp1 ?

Maybe this will do ; use ppp+ instead of ppp0 or ppp1.
ppp+ matches any ppp.


Gr,
Rob



