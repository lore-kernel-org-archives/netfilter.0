From: Arthur Kerpician <arthur@bluechip.ro>
Subject: Different routes
Date: Thu, 04 Jan 2007 22:18:15 +0200
Message-ID: <459D6107.6030007@bluechip.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,
The server I'm using is doing SNAT for the local network and has 2 NICs 
for 2 different ISPs and 1 NIC for the LAN. One of the ISPs is the 
backup one and the default gateway on the server is switched to this one 
if the primary one is down.
Now, how can I route several LAN clients (not all) through the backup 
connection, instead of the default one?

Thanks for the help,
Arthur

SPECS:
FC5
2.6.15-1.2054_FC5smp

