From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Loop back on firewall
Date: Wed, 16 Mar 2005 12:59:43 +0200
Message-ID: <4238119F.1030400@darkstar.nom.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Basic drawing to explain problem.

eth1 (192.168.192.1)
                  |
       Linux    FW
	         |
eth0 (172.17.0.1)
                  |
            LAN  A

My firewall has a nat for 192.168.192.1:80 to 172.17.0.10:80

 From a client I can not open a session to 192.168.192.1:80. Is this 
because of the connection tracking or is there a way to sort this out.


