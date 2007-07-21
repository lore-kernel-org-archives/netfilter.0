From: Georg Hohenberger <Georg@Hohenberger-online.de>
Subject: linux server as load-balanced gateway inside a network with 2
 routers using only one network interface
Date: Sat, 21 Jul 2007 23:22:44 +0200
Message-ID: <46A27924.8030402@Hohenberger-online.de>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

hi,
i am planing to use my linux-file-server as getway for the lan

this file-server has 3 network interfaces:
    Gigabit --> lan (switch)
    Gigabit --> my computer
    100Mbit --> lan (switch)

inside the lan there are two dsl router (my and my neighbours)

linux-file-server should do load-balancing using this routers to be the 
gateway to other pc in the lan and even do port-fowarding and qos 
(Quality of Service) for voice-over-ip

all this should be done over the 100mbit network interface

i would like to know if this is possible to do or not

ofcorse tips and hints would be great

thanks in advance

Georg form germany

