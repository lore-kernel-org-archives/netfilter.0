From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: ip_conntrack (again)
Date: Thu,  5 Aug 2004 10:05:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091718344.41124cc8e830f@securemail.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Well, we had been having problems with a client's firewall not working right, 
when there was a hardware failure, so we replaced it with a new Dell server.  
Now we're still having the same issue.  Seems very odd this is the only 
firewall we see this problem on, but maybe someone has an idea.  ip_conntrack 
seems to stop working, and for awhile we were able to just unload all the ip* 
modules, reload, and we were good.  Now, ip_conntrack seems to get stuck in a 
weird state:

# lsmod |grep ip_conntrack
ip_conntrack               0   0  (deleted)
# rmmod ip_conntrack
rmmod: module ip_conntrack is not loaded
# modprobe ip_conntrack
# lsmod |grep ip_conntrack
ip_conntrack               0   0  (deleted)

It doesn't seem to want to unload the module, and stays stuck in the "deleted" 
state.  Only way to get it working again appears to be to reboot.

Any ideas on how to fix or even track down the cause of this problem?  It's 
running standard Fedora Core 1, full patches and kernel 2.4.22-1.2197.nptlsmp.

Thanks!
Dan

