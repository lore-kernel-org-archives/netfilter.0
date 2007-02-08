From: Michael B Allen <mba2000@ioplex.com>
Subject: Drop random 20% of packets on port?
Date: Thu, 8 Feb 2007 18:14:07 -0500
Message-ID: <20070208181407.78f630a8.mba2000@ioplex.com>
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

I have several network protocol handlers that I would like to test. Can
someone recommend a method to deliberatedly drop a certain percentage
of packets destined for a particular port and in a random way using
netfilter or something else?

Mike

