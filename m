From: "Angel Tsankov" <fn42551@fmi.uni-sofia.bg>
Subject: ip forwarding and iptables
Date: Tue, 16 May 2006 00:21:29 +0300
Message-ID: <002301c67865$88d8d6e0$cf34000a@sven>
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
To: "ML: netfilter" <netfilter@lists.netfilter.org>

I have 2 PCs: one configured as gateway (PC1) and the other one (PC2) configured to use PC1 as gateway. PC1 runs a custom Linux 
distribution. It has ip
forwarding enabled (e.g. by echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf).
As far as I understand, I do not need to do anything else to make the kernel route traffic to and from PC2, right?
However, if I have one PC more - PC3, and I do not wnat to route traffic to and from it I need to configure the kernel, e.g. with
the help of iptables. Now if I do so, i.e. use iptables to configure the kernel, save the iptables configuration, setup the system
to reload it at startup (using the init.d scripts), is there any moment (during system startup) when ip forwarding has been enabled
but the iptables configuration has not yet been loaded and traffic could be routed to and from PC3?


