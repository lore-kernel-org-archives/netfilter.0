From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange log entries (again)
Date: Mon, 8 Jul 2002 21:58:19 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708205822.EMAP4119.mta06-svc.ntlworld.com@there>
References: <200207082243.35434.captain.nuke@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207082243.35434.captain.nuke@gmx.at>
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

On Monday 08 July 2002 9:43 pm, Patrick Petermair wrote:

> Hi!
>
> I have found the following log entry in my firewall log (I'm running RedHat
> 7.3 with iptables for firewalling and masquerading):
>
> Jul  8 22:25:11 wormhole kernel: IN=ppp0 OUT= MAC= SRC=207.171.169.16
> DST=213.225.41.145 LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=21031 DF PROTO=TCP
> SPT=80 DPT=42111 WINDOW=8760 RES=0x00 ACK RST URGP=0
>
> The thing is that this is an answer from a website (SPT=80) I surfed on
> (www.amazon.de) - but my forward chain should detect it as an existing
> connection and let it through:

This is an ACK RST packet, so it's quite likely that the connection tracking 
has already deleted the connection from the conntrack table (when it got the 
previous RST packet), therefore when this packet turns up, it no longer 
belongs to an ESTABLISHED connection.

Don't worry about it.

 

Antony.

