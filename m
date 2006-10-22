From: Pollywog <linux@shadypond.com>
Subject: installing ipsets
Date: Sun, 22 Oct 2006 01:05:15 +0000
Message-ID: <200610220105.15805.linux@shadypond.com>
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

I am running Debian Sarge and I have just installed iptables following the 
instructions at http://ipset.netfilter.org/   This documentation does not say 
whether I need to remove the iptables package provided by Debian, but I would 
guess this is necessary.  It appears the iptables version I downloaded from 
the ipsets homepage is a newer version of iptables than what is present in 
Debian Sarge but if I remove the Debian iptables package, I will need to put 
a dummy package in its place so as not to cause shorewall to be removed.

Does the old package need to be removed?


thanks

