From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 01:22:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708002259.PBWF23840.mta03-svc.ntlworld.com@there>
References: <007301c22610$e152fe00$0a01a8c0@ed> <20020707235549.ONWM23840.mta03-svc.ntlworld.com@there> <20020708001410.GA27192@mt.mk.cvut.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708001410.GA27192@mt.mk.cvut.cz>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 1:14 am, Martin Tomasek wrote:

> > I most commonly see it in port scans, and probes for http / sql holes.
>
> You cannot use random spoofed ip adresses with stateful protocol such as
> tcp.

Not if you want the connection to succeed, you can't, no - but if you're just 
trying to fill up some log files with misleading IP addresses, hoping to 
disguise the real ones which succeed in connecting, there's no reason you 
can't use a spoofed address for TCP.

> In tcp is possible to do only SYN floods with random ips -- which
> could be solved for example by syncookies.
>
> What you see in portscans or probes are real ips (excluding some
> portscan types, which uses "proxy" host).

Nmap, one of the commonest port scanners around, typically uses a 'half open 
SYN scan', and it can be told to liberally pepper the packets sent to the 
target machine with SYNs from false addresses (false as in they don't belong 
to the attacker; they may or may not exist as real addresses on some other 
machine).   Only the SYN/ACKs sent back to the real attacker's machine 
contribute to getting a result on the port scan, but the system being scanned 
can't tell which ones those are.

 

Antony.

