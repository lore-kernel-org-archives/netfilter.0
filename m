From: P Moyst <pmoyst@yahoo.ca>
Subject: Why would anyone want to SNAT a remote connection to the external
	ip address?
Date: Sun, 6 Mar 2005 20:49:17 -0500 (EST)
Message-ID: <20050307014917.28759.qmail@web30505.mail.mud.yahoo.com>
Mime-Version: 1.0
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

Hi

I joined the list a few days ago. The following chain
...

$iptables -t nat -A POSTROUTING -o eth1 -j SNAT
--to-source $external_ip

where... eth1 is the interface on the linux box for
the internal network and eth0 is the interface for the
internet.

What is the reason for this?

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

