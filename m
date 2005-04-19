From: "elg3ne" <sun@dap.edu.ph>
Subject: IP Forwading from Local IP to Live IP
Date: Tue, 19 Apr 2005 15:55:18 +0800
Message-ID: <002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>
References: <1079365863.2163.8.camel@vejan>
	<200403151608.12073.Antony@Soft-Solutions.co.uk>
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

Hi guys, Im new to iptables.. hope someone can help me to this.

The situation is this, I have a webserver running on a local network machine
(192.168.1.3) & I want it to be accessible outside my network. Is it
possible?

setup is like this:

workstation (192.168.1.3) ---> HUB ---> server ( LIVE IP, accessible
everywhere on the net )

when user access the live IP ex. 10.0.0.3 can he forward to get the files on
the worstation?

thanks


