From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: ftp
Date: Fri, 28 May 2004 14:04:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002a01c444ab$fa700c00$1201a8c0@admin>
References: <20040527193451.05B99DBD@sterenborg.info> <11f101c444aa$05bb5a30$49caa8c0@caris.priv>
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

> I guess my question was is it advisable to only allow active ftp ....
?  Or
> is that just not a reasonable idea ?  Or does the Related option make
> passive "safe" (ie, don't have to open a load of ports).

Netfilter is stateful, it will open the ports as needed.


Gr,
Rob


