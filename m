From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: sysctl vs. echo > /proc...
Date: Tue, 31 May 2005 00:57:30 -0500
Message-ID: <429BFCCA.9010505@riverviewtech.net>
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

Hey fellow TuX users out there, I have a question for you.

Does any one know the (technical) difference in using sysctl verses echoing values in to the appropriate areas in side of the /proc file system?  Which is the more current (expected in the future) practice?  Any ideas and / or thoughts on this matter would be greatly appreciated.  Consider this very simple and common example:

sysctl -w net.ipv4.ip_forward=1

verses 

echo "1" > /proc/sys/net/ipv4/ip_forward 



Grant. . . .

