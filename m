From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Windows VPN server behind iptables
Date: Fri, 17 Jan 2003 08:45:45 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c2be47$e1eb60d0$6601a8c0@s3ac>
References: <000e01c2bdd0$2314d410$0200a8c0@loaner>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <000e01c2bdd0$2314d410$0200a8c0@loaner>
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
To: 'John York' <john@logihost.com>, netfilter@lists.netfilter.org


> 
> I set up my first IPtables box, doing NAT and port 
> forwarding. I've managed to Google most of the kinks out, but 
> this one perplexes me. There is a Win2K VPN server behind the 
> firewall, using PPTP. It will accept connections, but chokes 
> before accepting the username/password. The most I've been 
> able to figure out is that it has something to do with protocol 47.
> 
> All other forwards (HTTP, HTTPS, POP, SMTP, Telnet) work 
> fine. Any ideas?

I tried to do exactly what yoru doing, I'll explain where I am.  In
order to support pptp traffic you have to support protocol 47, and allow
traffic forwarding on tcp port 1723. seems simple enough ..... Err no
trick is netfilter doesn't nativly support pptp traffic. The two options
you have are to get the latest POM and apply the pptp Nat patches. There
is also another patch available below. Let me know if yo uget it to
work. I gave up and went with an IPSEC implimentation which is just as
much a pain in the ass

http://www.impsec.org/linux/masquerade/ip_masq_vpn.html


