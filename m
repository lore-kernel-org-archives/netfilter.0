From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Problem with iptables module
Date: Tue, 5 Oct 2004 11:23:34 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <014a01c4aaef$5d500f10$bf07a8c0@civicXp>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

I've seen this a some of my boxes that are under RedHat 7.x. I Haven,t been 
able to pinpoint the exact problem, and is quite anoying...

The problem is that whever I want to restart (reload) iptables and it's 
rules, I use the /etc/rc.d/init.d/iptables script that came with the 
RedHat's RPM version of iptables. That scripts does the job of 
loading/unloading the necessary modules from the system.

So, on most boxes, I load the ip_conntrack_ftp modules to help use passive 
mode. When the script does a "modprobe -r ip_conntrack_ftp", it stalls 
there, I have to kill the script, and I'm not able to kill (even -9) the 
modprobe process, and this process sits there, eating 100% of the CPU.

When I do a lsmod, I don't see any ip_tables module except ip_conntrack, 
which is at the deleted state.

The current system I have this problem is a RedHat 7.1, kernel 2.4.20-24.7, 
iptables 1.2.8.
It does it also on a RedHat 7.3, custum kernel 2.4.24, patched (with only 
pptp_conntrack_patch) iptables 1.2.10.

Any hints on this ? 


