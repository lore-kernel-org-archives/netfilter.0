From: "Micah Wedemeyer" <fanmail@micah-wedemeyer.net>
Subject: limit speed of file transfer
Date: Fri, 21 Jan 2005 20:08:06 -0500
Message-ID: <001001c5001e$d80df760$0201a8c0@micah>
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

Hi,

My system consistently locks up on file transfers across the LAN.  When
transferring a file to it using scp, it dies after less than 5 seconds.
However, if I use it to download a file from the Internet (using wget),
it does just fine.

I have heard that my motherboard (a Via Epia MII) has DMA problems and
that high Ethernet traffic is known to lock them up.  My theory is that
the Internet connection is slow enough to not hit whatever magic
threshold causes the crash.  So, I was hoping to find a way to limit the
speed of transfers with scp and ftp so that they also don't lock up the
machine.

I asked on a few message boards, and they all mentioned iptables.  I've
never used it before, and am a total noob when it comes to networking
stuff.  So, I was hoping that the people on this list could point me in
the right direction of where to start.

To sum up:  I need a way to limit the speed of incoming file transfers
using ftp or scp.

Any help would be greatly appreciated,
Micah


