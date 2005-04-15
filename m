From: Christian Hedegaard <christian.hedegaard@trustcommerce.com>
Subject: Re: trying to get DNAT and SNAT working together.
Date: Fri, 15 Apr 2005 12:22:19 -0700
Message-ID: <4260146B.4000703@trustcommerce.com>
References: <426007EF.1020903@trustcommerce.com>
	<001501c541eb$ad39e620$eb2d4fca@HOME>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001501c541eb$ad39e620$eb2d4fca@HOME>
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

Bikrant Neupane wrote:
> Have you turned on ip forwarding  ? and make sure it is not dropped in the
> forward chain. just in case if you missed it :D
> If it supports, you can try tcpdump on the destination machine

oh my god...

I can't believe I overlooked that. yup, 'echo 1 > 
/proc/sys/net/ipv4/ip_forward' fixed the problem :(

I'm going to go sit in a corner for a little while now.

-- 
Christian Hedegaard-Schou
Sr. Systems Administrator
TrustCommerce
2 Park Plaza, Suite 350
Irvine, CA 92614
(949) 387 - 3747
christian.hedegaard@trustcommerce.com
http://www.trustcommerce.com/

