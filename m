From: "Adrian_Sanchez" <Adrian_Sanchez@actionline.com.ar>
Subject: How to safely unload netfilter modules for a fresh restart
Date: Thu, 08 Sep 2005 14:24:06 -0300
Message-ID: <WorldClient-F200509081424.AA24060075@actionline.com.ar>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everyone.
 
Is there a safe way to unload the netfilter modules in order to force a
clean iptables restart when needed? (especially regarding connection
tracking, which I need to zap)
 
If not, I do need to clear my connection states: is there a way to do this
without unloading the modules?
 
Most of the time I can cleanly unload the modules by flushing the tables
first, and then unloading the unreferred modules, then the remaining ones.
 
But depending on what I've doing from my box (ie: establishing an FTP
session), sometimes the "modprobe -r" / "rmmod" commands get stuck at 99%
CPU usage and the only way to get back to normal is by rebooting the box.
 
- Tried on a fresh Fedora Core 2 installation (kernel 2.6.5-1.358 +
iptables 1.2.9)
- Tried on a Fedora Core 2 upgraded installation (kernel 2.6.13 + iptables
1.3.3)
- Tried on a fresh Fedora Core 1 installation (kernel 2.4.22-1.2115.nptl +
iptables 1.2.7)
 
Always the same results.

Thanks for your comments.



