From: "Wojtek Nowak" <netfilterlist@altumnet.pl>
Subject: pom-ng sys requirements
Date: Thu, 15 Jul 2004 16:49:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008a01c46a7a$e9a78200$0200a8c0@wojtek>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

What are pom-ng-20040621 minimal system requirements?
On news, it says:
This is the second 'official' release of our collection of features
available for kernels >= 2.4.19, and >= 2.6.0.

I have Fedora Core 1 with linux-2.4.22-1.2197.nptl kernel,
and while pom-ng-20040302 runs OK:

[root@xxxx patch-o-matic-ng-20040302]# ./runme
Hey! KERNEL_DIR is not set.
Where is your kernel source directory? [/usr/src/linux]
Where is your iptables source code directory? [/usr/src/iptables]
/usr/src/redhat/SOURCES/iptables-1.2.9
Loading patchlet definitions...done

Welcome to Patch-o-matic (1.14)!
(...)

pom-ng-20040621 says:

[root@xxxx patch-o-matic-ng-20040621]# ./runme
Hey! KERNEL_DIR is not set.
Where is your kernel source directory? [/usr/src/linux]
Hey! IPTABLES_DIR is not set.
Where is your iptables source code directory? [/usr/src/iptables]
/usr/src/redhat/SOURCES/iptables-1.2.9
Your linux version 2.4.22 is too old and not supported at ./runme line 214
                   ^^^^^^ ?

-- 
Wojtek


