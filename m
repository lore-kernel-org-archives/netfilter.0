From: Justin Deoliveira <jdeolive@refractions.net>
Subject: IP Header Validation extension
Date: Fri, 01 Oct 2004 11:34:23 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415DA32F.4030606@refractions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I am wondering if anyone knows of the existance of a module/extension I 
can use to perform ip header validation. I want to do things like :

1. check the version (4 or 6)
2. make sure the total length field actual matches the length of the packet
3. check various options

Thanks.

Justin


