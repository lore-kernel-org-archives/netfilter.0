From: Stephen Jones <hivemynd@hivemynd.net>
Subject: Re: pptp conntrack patch missing argument
Date: Sun, 12 Dec 2004 00:32:11 -0600
Message-ID: <41BBE5EB.50603@hivemynd.net>
References: <1102718548.41ba265486969@webmail.sld.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102718548.41ba265486969@webmail.sld.cu>
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
To: Ali <ali@infomed.sld.cu>
Cc: netfilter@lists.netfilter.org

Hi Ali,

Thanks for the info!  I should be able to give this a spin, against a 
2.4.28 source tree, and test it in the next week or so!  Thanks again 
for pointing this out.  I didn't think of scanning the rest of the 
sources for calls to the same function in other sources, very good plan!

Best regards,

SJ

PS: I CC'd the netfilter list with your suggestion in the hopes that it 
does indeed fix the problem with the latest pom-ng release.

Ali wrote:

>Hi Stephen,
>
>While compiling a 2.4.27 kernel i suffered of the same problem you reported
>on the netfilter list and as you, searching on the web don't provide me any
>solution, but digging in the source i found that all calls to ip_nat_used_tuple
>in net/ipv4/netfilter/ip_nat_proto_* used the same convention:
>  if (!ip_nat_used_tuple(tuple, conntrack, maniptype, range->flags))
>changing line 108 in ip_nat_proto_gre.c to that make it compile cleanly. So far
>i haven't yet tested if it works ok but thougth that you may be interested :).
>
>Best regards,
>  Ali
>
>Pd: i'm not in the netfilter list (found your message in google) that's the reason to
>me writing you directly
>
>
>-------------------------------------------------
>Este mensaje fue enviado usando el servicio de correo en web de Infomed
>http://webmail.sld.cu
>
>
>  
>



