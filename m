From: "Afshin Lamei" <linux_st@hotmail.com>
Subject: Kernel options and loadable modules
Date: Sun, 08 Dec 2002 14:22:02 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F150MozgYLowspDKicU0001ede9@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
There are several kernel options needed for firewalling, wich must be 
selected while compiling the kernel, such as :
CONFIG_NETFILTER, CONFIG_PACKET, CONFIG_IP_NF_CONNTRACK, etc.
I want to now that what is the differnce between the kernel options and 
loadable modules such as ip_nat_ftp, ip_tables, ... ? Are they the same in 
importance and what loadable modules are exactly needed for running 
iptables?
regards,
-afshin


_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail


