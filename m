From: Maurizio  <maurizio@adisurm1.it>
Subject: Enabling Xwindow connection
Date: Tue, 10 Jun 2003 16:53:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306101653.27527.maurizio@adisurm1.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi all.
I have a LAN with private addresses protected by a firewall which run iptables 
1.2.7a. I need to allow connections from clients in the LAN to an external X 
server. The clients run Xwin32. Which port do I have to enable in the FORWARD 
table and which protocol? I tried to enable port 6000:6036 TCP but the 
clients cannot connect to the external server. I just do NAT postrouting, do 
I have to do prerouting, also?

TIA

Maurizio 

