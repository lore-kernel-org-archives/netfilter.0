From: Jean-Marie Orset <jm.nfilter@laposte.net>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 16:27:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211162716.090b4c59.jm.nfilter@laposte.net>
References: <20031211105506.6c530c5a.jm.nfilter@laposte.net>
	<20031211145408.GB32747@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
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
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@lists.netfilter.org

Le Thu, 11 Dec 2003 15:54:08 +0100
Damjan a =E9crit:


> Maybe TARPIT is what you need?
> Adds a TARPIT target to iptables, which captures and holds incoming > T=
CP
> connections using no local per-connection resources. Connections are
> accepted, but immediately switched to the persist state (0 byte > windo=
w),
> in which the remote side stops sending data and asks to continue every
> 60-240 seconds.  Attempts to close the connection are ignored, forcing =
> the
> remote side to time out the connection in 12-24 minutes.

Mhh, it seems very interesting. I will try it.

> --=20
> Damjan Georgievski
> jabberID: damjan@bagra.net.mk

