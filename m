From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: XP DNS requests
Date: Mon, 14 Jun 2004 23:02:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087268528.2010.14.camel@grendel>
References: <E9E5BFC4DD34D511B79900104B939D780325D27D@GB-CSC-EXCH-8>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E9E5BFC4DD34D511B79900104B939D780325D27D@GB-CSC-EXCH-8>
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
To: "Wyburn, Marc Anil" <Marc.Wyburn@gb.unisys.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2004-06-14 at 09:25, Wyburn, Marc Anil wrote:
>
> Jun	14	10:00:31	fw	kernel:	IN=eth1	OUT=	eth0 SRC=192.168.0.19 DST=***.***.***.*** LEN=61	TOS=0x00 PREC=0x00 TTL=127 ID=26601 PROTO=UDP SPT=1029 DPT=53 LEN=41	

You didn't specify what rule is logging this traffic. Is it your default
drop rule or something earlier?

Try this on the XP box the next time queries start to fail:

ipconfig /flushdns

If you now start working fine, your DNS is just running slow and XP is
caching negative entries. Make the following reg key change:

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters

DWORD: MaxNegativeCacheTtl
Value: 0

Reboot and you should be all set.

HTH,
Chris



