From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 15:43:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111543.30807.Antony@Soft-Solutions.co.uk>
References: <20031211105506.6c530c5a.jm.nfilter@laposte.net> <20031211145408.GB32747@legolas.on.net.mk> <20031211163202.57af9256.jm.nfilter@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031211163202.57af9256.jm.nfilter@laposte.net>
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

On Thursday 11 December 2003 3:32 pm, Jean-Marie Orset wrote:

> > Well, you could just:
> > -p tcp -j REJECT --reject-with tcp-reset (uses tcp rst)
> > -p udp -j REJECT (uses icmp port-unreach)
> >That makes nmap say: ports closed.
>
> Yes, that's what I should do but My idea was to answer false SYN,ACK
> even if the ports are closed. In that way a scan would declare all my ports
> open but in reality, they would be closed.

Why is that better for security?

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


