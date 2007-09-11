From: David Martin <dmartin@mediatvcom.com>
Subject: modify source IP of local processed packets before routing
Date: Tue, 11 Sep 2007 17:31:15 +0200
Message-ID: <46E6B4C3.10801@mediatvcom.com>
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

Hi,

My goal is to modify the source IP address of local processed packets 
but it has to be done before any routing (so the packet will be directed 
to the right interface according the modification).

I know there is the SNAT possibility for postrouting, but it does not 
work on the Output table.

any idea?


