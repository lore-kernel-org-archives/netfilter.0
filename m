From: Justin Hammond <fish@dynam.ac>
Subject: How to disable ip_contrack_irc when its compiled into the kernel?
Date: 28 Dec 2002 00:55:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1041008143.15849.81.camel@fish-dt.dmz.dynam.ac>
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

Hi all

We have a problem on one of our servers. Its running:

Linux 2.4.17 on a Sparc Box with IPtables 1.2.4

The Kernel support for IPtables was compiled into the kernel, not as
loadable modules, and now we have some problems. 

We recently setup a IRC server for a customer, and they came back and
told us that DCC sending was not working for any client connected to
this IRC server. A quick check of the logs revealed:

Forged DCC command from 218.103.157.103: 1.154.254.169:0
Forged DCC command from 218.103.157.103: 1.154.254.169:0
Forged DCC command from 218.103.157.103: 1.154.254.169:0
Forged DCC command from 218.103.157.103: 1.154.254.169:0


Throughout the entire kernel log. 

(I believe the problem has been fixed in later releases of iptables, so
I'm not after a fix)

Now here is my problem. The Server is in Sydney, Australia, and I'm in
Singapore, around 8000Miles away, so doing a remote kernel compile and
reboot to remove the contrack_irc module is not something that I fancy. 

I'm wondering if there is a Rule or way that I can disable the contrack
module from operating?

Thanks :)

Justin



