From: Carlo Pires <carlo@uga.com.br>
Subject: iptables-1.2.8-20030929 does not compile connmark match lib module
Date: Tue, 30 Sep 2003 16:22:54 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F79D80E.2010903@uga.com.br>
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
To: netfilter@lists.samba.org

Well, after compile k2.4.22 with patch-o-matic-20030929 from snapshot I 
had some problems to compile iptables-1.2.8-20030929. The match lib 
module libipt_connmark didn't compile.

iptables-1.2.8-20030929 seens to lack some .xxx-test file in extensions 
after I check this I found missing the following files:

.NETLINK.test
.connmark-test

Then I just put these files from iptables-1.2.8.tar.bz2 package to 
extensions dir of iptables-1.2.8-20030929 package and everything 
compiled well.

[]s
Carlo


