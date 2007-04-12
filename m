From: Steve <netfilter@arntzen.us>
Subject: No timestamp on log entries.
Date: Thu, 12 Apr 2007 07:26:46 -0500
Message-ID: <200704120726.46248.netfilter@arntzen.us>
Reply-To: netfilter@arntzen.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I am running DSL with kernel 2.4.26 and iptables 1.2.6a.

When I use -j Log, I see the log of blocked packets, but without a timestamp.  
I can't seem to find out why and don't know if there is an iptables or 
syslog/klog option to use to add the timestamp.

Thanks in advance for your help,

Steve.


