From: Jean-Marie Orset <jm.nfilter@laposte.net>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 16:32:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211163202.57af9256.jm.nfilter@laposte.net>
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

> Well, you could just:
> -p tcp -j REJECT --reject-with tcp-reset (uses tcp rst)
> -p udp -j REJECT (uses icmp port-unreach)
>That makes nmap say: ports closed.

Yes, that's what I should do but My idea was to answer false SYN,ACK
even if the ports are closed. In that way a scan would declare all my ports open but in reality, they would be closed.
But I recognize that it is a a little tortured idea.. ;-)

> I saw yesterday that Craig Shelley did provide such a module on the
devel-list
> in june but I can't recover the tarball he sended in attachment.
> :-) Maybe you could try email him and ask for publishing it somewhere

Yes it's done, but he seems to be in holliday :-)

Thank you


