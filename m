From: =?ISO-8859-15?Q?Sebastian_B=F6hm?= <seb@exse.net>
Subject: pptp & NAT
Date: Fri, 04 Nov 2005 04:53:48 +0100
Message-ID: <436ADB4C.7070800@exse.net>
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

i finally got pptp and NAT working with the patch for bug #397 
<https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=397>.

Two questions left:

- sometimes (every 10th connection attempt or so) the connections fails 
with "GRE: read(fd=5,buffer=8056720,len=8260) from network failed: 
status = -1 error = Protocol
not available" reading in the server logs. I use windows clients with 
linux server. somewhere I read that I should load ip_gre on the firewall 
or block a specific icmp packet, is that correct ? (I dont like to block 
icmp, icmp is there for reason)

- I am unable to estabish two pptp connections from one client, I can 
connect to one pptp server and I can connect to a second pptp server, 
but the second connection never accepts any traffic, when I stop the 
first connection, the second connection begins to work. Is this a bug or 
a known missing feature ?


Thank you very much !

/sebastian


