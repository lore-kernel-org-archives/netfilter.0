From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: forwarding
Date: Tue, 18 May 2004 15:15:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084907744.7259.62.camel@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: alucard@kanux.com, netfilter@lists.netfilter.org

On Tue, 2004-05-18 at 14:23, Daniel Chemko wrote:
> iptables -t nat -A POSTROUTING --destination ${server2} -j SNAT --to
> ${server1_internal_ip}
> 
> This is the last time I try to respond to you since you've been ignoring
> the rest. SNAT traffic from server 1 to server 2. Period. There's no
> magic. Put it in, then the system will magically work. Well, replace the
> ${}'s with the actual values first.
> 
> If you even get this email, let me know cause I feel like I'm falling on
> deaf ears.
Daniel, that was a problem but he has changed the default gateway to
ensure that the packets do make it back to the gateway.

From a previous post:
[root@linserv root]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.0.0     *               255.255.255.0   U     0      0        0
eth1
10.73.216.0     *               255.255.252.0   U     0      0        0
eth0
169.254.0.0     *               255.255.0.0     U     0      0        0
eth0
127.0.0.0       *               255.0.0.0       U     0      0        0
lo
default         192.168.0.1     0.0.0.0         UG    0      0        0
eth1

I believe 192.168.0.1 is the gateway.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


