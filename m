From: Philip Craig <philipc@snapgear.com>
Subject: Re: Conntrack PPTP broken in 2.4.22 ?
Date: Fri, 12 Sep 2003 10:37:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F611548.4020102@snapgear.com>
References: <000001c375fb$d3264e90$f901010a@SC2003002>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c375fb$d3264e90$f901010a@SC2003002>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Enrico Demarin <enricod@videotron.ca>
Cc: netfilter@lists.netfilter.org

Enrico Demarin wrote:
> I have tried to use the pptp_conntrack patch from the last patch-o-matic
> on Linux kernel 2.4.22 , but with that patch applied, apps using
>  
> getsockopt SO_ORIGINAL_DST stop working  :
>  
> the perror i get is : 
>  
> getsockopt(SO_ORIGINAL_DST): No such file or directory

The following patch in the netfilter patch-o-matic CVS is meant to fix this:

http://cvs.netfilter.org/~checkout~/netfilter/patch-o-matic/pending/63_getorigdst-tuple-zero.patch?sortby=rev

But unfortunately that patch is broken too, and you'll need to apply the
patch from this message to fix the patch:

http://lists.netfilter.org/pipermail/netfilter-devel/2003-September/012382.html

(Btw, check the netfilter-devel archives for this month for some
discussion about what patches you need for pptp conntrack.)

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


