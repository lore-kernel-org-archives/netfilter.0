From: Chamara Gunaratne <pgunarat@csee.usf.edu>
Subject: make error with iptables 1.2.11
Date: Tue, 29 Jun 2004 16:45:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291645.13172.pgunarat@csee.usf.edu>
Reply-To: pgunarat@csee.usf.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello All,
I am trying to make and install ip_tables and I am getting an error when 
running make. I am running SuSE 8.2 with kenel release 2.4.26 and I have 
patched the kernel using patch-o-matic. The command I gave and the output I 
got is:

iptables-1.2.11> make KERNEL_DIR=/usr/src/linux-2.4.26/
Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** [../ipset/libipt_set.h] Error 1

I would greatly appreciate it if somebody can shop me what I am doing wrong 
here. Thanks !

Chamara Gunaratne


