From: "IT Clown" <iptables@mailbox.co.za>
Subject: x
Date: Sat, 27 Mar 2004 18:15:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-268947125@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi all

Im new to iptables when i configure iptables X server wont
load i have the following in my iptables file:

*filter
:INPUT DROP [0.0]
:OUTPUT DROP [0.0]
:FROWARD DROP [0.0]

-A OUTPUT -p tcp -dport 0:80 -j ACCEPT


Any idea why x server wont load?

Regards
__________________________________________________________________________
http://www.webmail.co.za/dialup Webmail ISP - Cool Connection, Cool Price

