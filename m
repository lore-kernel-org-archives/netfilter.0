From: Damjan <gdamjan@mail.net.mk>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 15:54:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211145408.GB32747@legolas.on.net.mk>
References: <20031211105506.6c530c5a.jm.nfilter@laposte.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031211105506.6c530c5a.jm.nfilter@laposte.net>
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
To: netfilter@lists.netfilter.org
Cc: Jean-Marie <jm.nfilter@laposte.net>

> >If a module like this existed it would be a great way to violate the
> >protocol and cause antisocial behaviour of your tcp stack.
> 
> Yes, I agree, but in any case there would be more efficient ways to
> cause antisocial behaviour. In fact, in the beginning, my idea was to return a RST,ACK, for each SYN received on one of my closed ports, in order to make a scan tool belive that they are all open. (Perhaps it is useles but I  found the idea amusing.

Maybe TARPIT is what you need?
Adds a TARPIT target to iptables, which captures and holds incoming TCP
connections using no local per-connection resources.  Connections are
accepted, but immediately switched to the persist state (0 byte window),
in which the remote side stops sending data and asks to continue every
60-240 seconds.  Attempts to close the connection are ignored, forcing the
remote side to time out the connection in 12-24 minutes.


-- 
Damjan Georgievski
jabberID: damjan@bagra.net.mk

