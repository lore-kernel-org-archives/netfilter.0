From: Filip Sneppe <filip.sneppe@uptime.be>
Subject: Re: compilation problem with cuseeme patch.
Date: 15 Feb 2004 14:41:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076852498.12832.2.camel@exile>
References: <1076587638.1004.49.camel@krishnap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076587638.1004.49.camel@krishnap>
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
To: Krishna Prasanth P <krishnap@teneoris.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-02-12 at 13:06, Krishna Prasanth P wrote:
> Hi!!
>  I'm trying to use cuseeme patch with netfilter and downloaded the patch
> from the cvs repository.
> While building the kernel with the new patch, i'm not able to do
> linking. The reason is the cuseeme(ip_nat_cuseeme.c) is using function
> ip_nat_mangle_udp_packet() function which is not defined.
> 
> Please let me know, if i'm missing some other things while adding the
> patch.
> 
Hi Krishna,

You will need at least kernel version 2.4.20 + the "03_2.4.21.patch"
from patch-o-matic/submitted/ for this to compile and work correctly.

ip_nat_mangle_udp_packet entered the kernel somewhere between 2.4.20
and 2.4.21 and is needed by the cuseeme nat module.

regards,
Filip


