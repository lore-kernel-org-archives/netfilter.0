From: "Deepak Seshadri" <d_s123@hotmail.com>
Subject: modprobe -r ip_conntrack_ftp problem
Date: Thu, 22 Sep 2005 11:43:01 -0400
Message-ID: <BAY107-DAV9BE54F7ED641AB101EAA8B7970@phx.gbl>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello All,
Good day!

When I try to restart iptables by "servce iptables restart", the process 
hangs in the "Unloading modules" section.
ps -ef|grep modprobe shows that it is trying to remove ip_conntrack_ftp 
module.
The CPU has shot to 100% usage. I am not even able to kill the module. Could 
someone, please tell me what is happening here? What is the workaround?
It does not happen always.

OS: Fedora core 2
iptables v 1.2.11
kernel: 2.6.8.1

Any help will be appreciated.
Thank you,
Deepak 

