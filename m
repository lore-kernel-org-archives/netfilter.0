From: Werner Schalk <werner_schalk@gmx.de>
Subject: Iptables and vserver
Date: Sun, 20 Mar 2005 17:10:46 +0100
Message-ID: <200503201710.46087.werner_schalk@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Hi,

I am currently facing a chicken-egg kinda problem and I was wondering whether 
you guys would be able to help me on that one. My setup is as follows:

Inet -> Host a.b.c.d (providing SSH, HTTP and DNS services) -> several 
VServers, 10.0.1.x (all providing SSH and HTTP as well)

So set up PRE- and POSTROUTING rules and I was able to transparently access 
the 10.0.1.x network. However of course I am not able to access the SSH and 
HTTP servers on the host itself anymore because iptables can not 
differentiate between the SSH and HTTP server provided by my host with the 
(one and only) public IP address and those servers provided by the Vserver 
the host also acts as a DNS server for. Can anybody point me to feasable 
solutions to this problem because I don't want (or actually I simply can't) 
to use more than public IP address on the host. Anyone? Might that be 
possible with advanced routing maybe?

Thanks a lot.

Bye,
Werner

