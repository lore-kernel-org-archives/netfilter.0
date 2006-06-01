From: Philip Craig <philipc@snapgear.com>
Subject: Re: Perfomance problem on MIPS
Date: Thu, 01 Jun 2006 18:55:06 +1000
Message-ID: <447EAB6A.1000006@snapgear.com>
References: <19506.060601@sigrand.ru>
	<20060601094654.a603gs9n082s4gc0@webmail.kwsoft.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060601094654.a603gs9n082s4gc0@webmail.kwsoft.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 06/01/2006 05:46 PM, lst_hoe01@kwsoft.de wrote:
> Zitat von art <art@sigrand.ru>:
>> It's wery upset fact. What can be done with this? Can I get version
>> where NAT not depend on Connection tracking?
> 
> For performance see
> 
> http://people.netfilter.org/kadlec/nftest.pdf
> 
> For NAT without conntrack use NOTRACK or disable connection tracking at all.

You cannot use the standard kernel NAT without connection tracking.

It should be possible to write some stateless mangle targets that
can do simple address rewriting if that is all you need (this is the
equivalent of what the fast nat in 2.2 and 2.4 kernels did).

But if you need many to 1 NAT, or complex protocols such as FTP,
then you must use connection tracking.

