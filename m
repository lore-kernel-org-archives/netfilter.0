From: Piotrek Kaczmarek <kaczorek@k.daleka.net>
Subject: conntrack error
Date: Fri, 11 Feb 2005 11:55:19 +0100
Message-ID: <20050211105519.GA14110@daleka.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I encountered the following situation - when there are around 20000 connections
"cat /proc/net/ip_conntrack" doesn't display all connections and outputs
"cat: No space left on device" error. If I patch kernel with POM and 'nth' module
(only patch, don't load the module) the same happens around 17000 connections.
It happenes both with 2.6.9 and 2.6.10 kernels.

Why is it so? Is this matter of memory limit or something else?

Thank you in advantage,

-- 
Piotrek Kaczmarek

