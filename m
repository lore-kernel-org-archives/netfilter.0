From: Juergen Stohr <juergen.stohr@lpr.e-technik.tu-muenchen.de>
Subject: Re: bug? blocked packets get shadowed to internal network
Date: Thu, 14 Aug 2003 15:50:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814155008.A25119@rcs.ei.tum.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi Chris,
>
> > we are using a firewall with RedHat kernel 2.4.20-19.7. The firewall is
> > configured to block every packet with DPT 199 into our network.
>
> You haven't given us your ruleset. Are you using a REJECT rule, especially
> with TCP reset?

Yes, we are using REJECT with TCP reset
iptables -A DRP_PCKT -p tcp -j REJECT --reject-with tcp-reset

>
> > IN= OUT=eth0 SRC=xxx.xxx.151.184 DST=xxx.xxx.11.231 LEN=40 TOS=0x00 PREC=0x0
0 TT
> > L=255 ID=0 DF PROTO=TCP SPT=199 DPT=34869 WINDOW=0 RES=0x00 ACK RST URGP=0
>
> This looks like a completely standard TCP reset. I can't tell for sure
> without seeing your ruleset, but I suspect that either you are blocking
> the incoming packet with -j REJECT --reject-with tcp-reset, or else it's
> not being blocked at all, and what you see is the kernel resetting the
> connection in the normal way (since it's not listening on that port).

I will attach the complete ruleset to this mail. The problem is, that
the packet resetting the connection appears on the "wrong" interface. So if
eth1 is our external interface, the kernel should sent a RST ACK also to
eth1 (and not to eth0 which is the internal interface). As mentioned, the
2.4.18 didn't show that behaviour.

cheers,
        juergen


