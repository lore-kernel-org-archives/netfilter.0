From: Ray Leach <bob@home.com>
Subject: iptables / network / linux issue ...
Date: Thu, 11 Dec 2003 14:32:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071145955.22911.9.camel@raylinux.internal>
Reply-To: spoons@rchq.co.za
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi

I have a strange network / iptables / Linux problem. I don't know which
it is yet ...

If I ssh to my firewall (which has 4 NIC installed), I then ftp back to
an ftp server on eth2 segment of the firewall and get a whole bunch of
files (about 20 totaling 100MB), I get a transfer rate of 110KB/s
(800Kb/s) - measured on both ends of the connection. This is on a 100Mb
network.

I then ftp from the machine on the internal LAN (eth2) through the
firewall to a machine in the DMZ (eth1 on the firewall). Now I get 1MB/s
- that's more like it.

Any ideas why the first transfer could be so slow?

I have checked my -m limit iptables rules and verified (as can be seen
above) that they are not limiting the packet rate.

Regards

Ray


