From: "Sunny Shum" <sshum@empowertechnologies.com>
Subject: Default routing setup
Date: Fri, 3 Sep 2004 14:38:05 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409032138.i83Lc6cn011411@melmac.stargate.ca>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
 
I am a newbie into the Linux world, and I recently built a firewall box (2
NICs, internal network as 192.168.1.xxx) with RedHat 9.  Everything works
fine, except the routing table.  Every time when the system has reboot, I
have to do the following command:
 
prompt>route del default
 
prompt>route add default gateway xxx.xxx.xxx.xxx [external gateway IP]
 
Because I don't do that, and if I just type "route" at the prompt, the
default is point back to the internal NIC.  Is there a way to make this
permanent?  I tried to edit the file /etc/sysconfig/network by adding the
line "GATEWAY=xxx.xxx.xxx.xxx" but it doesn't work.
 
Thanks!
 
Sunny Shum
 
