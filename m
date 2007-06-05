From: "noa levy" <noalevy@gmail.com>
Subject: SNAT before IPSec
Date: Tue, 5 Jun 2007 15:29:47 +0300
Message-ID: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ePStzJU2D3N5THV4SDG1I+gsGVN16RjGYMIUqi/f/dUEZkCbORFnn8t6c697n6+tizH/T3XYwpNg9DruQ47zPjyM7gpH8vTv91rEpGtNufBcMF9HL+JR7HyFIJSJtTKpy+i60FfRjFitvd6PXtl0ffVJ2S2tAGKx1SvnHFoHXHA=
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi All,

I have a setup where I need to SNAT traffic that will be going out via
an IPSec tunnel. The NAT must take place before the IPSec
encryption+encapsulation, so I need the packet to first go through
SNAT and then match an IPSec policy. After being IPSec-ified, I need
the packets to go through routing again.
My question:
SNAT takes place in POST_ROUTING. Can IPSec be applied after that? I
have read that after IPSec the packet gets injected to LOCAL_OUT
again, but when does the actual IPSec policy decision take place?
Won't it happen *before* SNAT? Can I control it?

Thanks,
Noa

