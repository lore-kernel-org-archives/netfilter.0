From: "prince" <prince@resoftcorp.com>
Subject: iptables v1.2.7a: can't initialize iptables table `filter'
Date: Mon, 12 Jan 2004 16:19:33 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040113001933.M22372@resoftcorp.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Group,

I am getting the following whenever I tried to do any operation with iptables.

% iptables -L

iptables v1.2.7a: can't initialize iptables table `filter': iptables who? (do 
you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

% rpm -qa | grep kernel
kernel-pcmcia-cs-3.1.31-13
kernel-2.4.20-28.9
kernel-BOOT-2.4.20-28.9
kernel-doc-2.4.20-28.9
kernel-source-2.4.20-28.9

% lsmod
Module                  Size  Used by    Not tainted
e1000                  54528   1 
ext3                   61280   2 
jbd                    46804   2  [ext3]
3w-xxxx                36192   3 
sd_mod                 11916   6 
scsi_mod               63416   2  [3w-xxxx sd_mod]

How do I get this resolved? It seems the problem is after I upgraded the 
kernel. I am running RH 9.

Thanks,
Prince. 

