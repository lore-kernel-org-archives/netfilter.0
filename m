From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 11:48:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005201c3bfd4$4ecebf10$0e25fe0a@southpark.ae.poznan.pl>
References: <20031211105506.6c530c5a.jm.nfilter@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> cause antisocial behaviour. In fact, in the beginning, my idea was to
return a RST,ACK, for each SYN received > on one of my closed ports, in
order to make a scan tool belive that they are all open. (Perhaps it is
useles but I
> found the idea amusing.
Well, you could just:
-p tcp -j REJECT --reject-with tcp-reset (uses tcp rst)
-p udp -j REJECT (uses icmp port-unreach)

That makes nmap say: ports closed.

> I saw yesterday that Craig Shelley did provide such a module on the
devel-list
> in june but I can't recover the tarball he sended in attachment.
:-) Maybe you could try email him and ask for publishing it somewhere

Regards,
Maciej


