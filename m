From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: FW: QUEUE problem on RH-E-WS-4
Date: Mon, 09 May 2005 01:21:49 -0500
Message-ID: <427F017D.1020300@riverviewtech.net>
References: <000001c553f7$fffe4a90$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c553f7$fffe4a90$2801a8c0@MBRC40>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Michael D. Berger wrote:
> In:
>    /usr/src/kernels/2.6.9-5.EL-i686/.config
> I find:
>    CONFIG_IP_NF_QUEUE=m
> 
> where other items have "=y" instrad of "=m".
> Might this be related to my problem?  Do I
> have to recompile the kernel?
> Thanks,
> Mike.

All the "=m" means is that the NF_QUEUE code was compiled as a module and would need to be insmod(ed) or modprobe(ed) before you could use it to make sure that the kernel has the module loaded.  Sorry, I can't help you with libipq directly as I know nothing about it.  :(



Grant. . . .

