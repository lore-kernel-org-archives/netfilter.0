From: Tom - 2Ergo Technical Support <tom.stockton@2ergo.com>
Subject: illegal ftp port request / ip_nat_ftp
Date: Fri, 25 Feb 2005 11:01:02 +0000
Message-ID: <1109329262.1686.16.camel@bobby>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi there,

I'm seeing some funny behaviour on one of my debian woody firewalls.  It
manifests itself when making an active ftp connection from a Snatted
client behind the firewall with the following error

ftp> ls
501 Illegal PORT command
ftp: bind: Address already in use

I have the ip_nat_ftp and ip_conntrack_ftp modules loaded and the
following version of iptables

ii  iptables              1.2.6a-5              IP packet filter administration tools for 2.4.4+ kernels

The firewall is running a custom 2.4.26 kernel.  I also have exactly the
same kernel and version of iptables running on another firewall, however
this does not display the same problems.

I have run ethereal to see what is going on and it appears that the
firewall is modifying the PORT command and sending too many parameters.

ie.

seen on the inside interface of the firewall:

PORT 192,168,1,2,179,133

which is ok

however when seen on the outside interface it appears as:

PORT 10,1,1,2,179,133,133

which has a superfluous '133' parameter

192,168,1,2 - private ip address
10,1,1,2 - public ip address


Any tips / advice / suggestions much appreciated.

Regards

Tom

-- 
Tom - 2Ergo Technical Support <tom.stockton@2ergo.com>


