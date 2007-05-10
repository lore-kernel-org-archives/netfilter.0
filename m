From: gcho <gcho@nalgo.co.jp>
Subject: how to return a packet back to netfilter
Date: Thu, 10 May 2007 17:27:28 +0900
Message-ID: <20070510171309.61A0.GCHO@nalgo.co.jp>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

Using NF_STOLEN I kept a ip packet by my hook function on NF_IP_PRE_ROUTING,
how can I return the stolen packet back to NF_IP_LOCAL_IN or NF_IP_FORWARD
after any other packet which I need arrived at NF_IP_PRE_ROUTING.

Faithfully
chou.genpou



