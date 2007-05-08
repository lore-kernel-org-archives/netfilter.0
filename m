From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: 'tcpmss' match for ip6tables ?
Date: Tue, 08 May 2007 21:26:13 +0200
Message-ID: <4640CED5.7050301@plouf.fr.eu.org>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I see with great pleasure that the 'TCPMSS' target for IPv6 has been 
added in the latest kernel and will be supported by the next ip6tables 
release. This will be useful for some people I know who have MTU trouble 
with PPPoE connections.

Now my question : are there similar plans for the 'tcpmss' match ? I do 
not see support for it in the next ip6tables, although the kernel part 
has been moved to xtables.

