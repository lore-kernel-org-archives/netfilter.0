From: Jean-Marie Orset <jm.nfilter@laposte.net>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 16:57:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211165740.0858d1c6.jm.nfilter@laposte.net>
References: <20031211105506.6c530c5a.jm.nfilter@laposte.net>
	<20031211145408.GB32747@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031211145408.GB32747@legolas.on.net.mk>
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

> Why is that better for security?

Well, I don't pretend that's better for security. In fact, it would be more difficult for a scanner to find a port really open among all other falsely open. If I drop or reject the SYN msg on those ports the scanner will deduce they are filtred or closed and it will see the real open ports. However, if it sees all the ports open, it has to test more accurately the ports for finding a real open one.

