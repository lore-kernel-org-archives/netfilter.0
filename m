From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: Port forwarding not working (nfcan: to exclusive) (nfcan: to
 exclusive)
Date: Sun, 29 Apr 2007 15:29:55 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704291529470.22744@yvahk01.tjqt.qr>
References: <000c01c78a5f$3d392570$dededede@neilhp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c78a5f$3d392570$dededede@neilhp>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Aggarwal <neil@JAMMConsulting.com>
Cc: netfilter@lists.netfilter.org


On Apr 29 2007 08:06, Neil Aggarwal wrote:
>
>> Maybe you could use SNAT to make the packets appear
>> to come from the firewall, then they ought to come back. 
>
>How do I set up the SNAT rule?

man iptables



Jan
-- 

