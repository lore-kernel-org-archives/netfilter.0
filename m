From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: help bootp filters
Date: Mon, 16 Jun 2003 10:41:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030616144116.GB30628@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019285@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A019285@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Yoann <yoann.juet@ifrance.com>, netfilter@lists.netfilter.org

On Mon, Jun 16, 2003 at 10:56:04PM +1000, George Vieira wrote:

> If I'm not wrong, I think tcpdump works on a different layer to netfilter so even though it's dropped I think tcpdump still sees them.... but I may be wrong.
> Does it eventually give out DHCP IP's or receives an IP addres or doesn't it? If DHCP isn't working then it's probably dropped but tcpdumps still sees them..
>  
> I just did a test from work to home which I'm defiantely blockinh port 6665 and I get the same results but I know 6665 is being dropped... yet TCPDUMP catches it before netfilter.
>  
> Jun 16 22:52:24 newjackswing kernel: INET IN=ppp0 OUT= MAC= SRC=203.111.79.114 DST=150.101.112.146 LEN=60 TOS=0x00 PREC=0xE0 TTL=50 ID=44842 DF PROTO=TCP SPT=3698 DPT=6665 WINDOW=5840 RES=0x00 SYN URGP=0 OPT (020405840402080A0B09245F0000000001030300)
> 
> [root@newjackswing /usr]# tcpdump -x port 6665
> Kernel filter, protocol ALL, datagram packet socket
> tcpdump: listening on all devices
> 22:52:24.984380 if134 < work.domain.com.3698 > myhome.domain.com.6665: S 614501237:614501237(0) win 5840 <mss 1412,sackOK,timestamp 185148511 0,nop,wscale 0> (DF) [tos 0xe0]
>                          45e0 003c af2a 4000 3206 76d8 cb6f 4f72
>                          9665 7092 0e72 1a09 24a0 8b75 0000 0000
>                          a002 16d0 0795 0000 0204 0584 0402 080a
>                          0b09 245f 0000 0000 0103 0300
> 
> So I think I might be right? Anybody wanna shed some light with this layer stuff ;) I'm confused on that part ;P

You are right. tcpdump would see the packets before any filter chains...

Ramin

