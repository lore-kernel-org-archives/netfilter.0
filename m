From: "Leonid Zeitlin" <lz@csltd.com.ua>
Subject: IPSec masquerade with multiple clients
Date: Fri, 13 May 2005 14:06:07 +0300
Message-ID: <015901c557ab$c31c19b0$5101a8c0@ALEPH>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
I have the following problem. I have a local network behind a Linux router
that does IP masquerade. All hosts on the LAN have 192.168.*.* addresses,
and the Linux router has only one external IP address. I need IPSec VPN
clients from the LAN to connect to an outside server. The client VPN
software is Contivity VPN Client by Nortel Networks. If only one clients
connects at a time, everything works fine. But once one client connects, no
other client can do so. For the second client the connection cannot be
established. Is there any way to have multiple clients connect to the
external VPN server simultaneously? Any help will be appreciated.

Thanks in advance,
   Leonid


