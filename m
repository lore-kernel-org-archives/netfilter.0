From: Stephen Liu <satimis@icare.com.hk>
Subject: Starting iptables problem
Date: Fri, 24 Oct 2003 20:29:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F998BA4.7070001@icare.com.hk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all folks,

I just finished installing Gentoo 1.4 and could not start iptables

# rc-update add iptables default
 * iptables already installed in runlevel default; skipping

# /etc/init.d/iptables status
 * status:  stopped

# /etc/init.d/iptables start
 * WARNING:  "net.eth0" has already been started.
 * Not starting iptables. First create some rules then run
 * /etc/init.d/iptables save

Kindly advise how to proceed.  Thanks in advance.

B.R.
Stephen Liu


