From: "Mato Vidovic" <mvidovic@gmx.at>
Subject: iptables  + ROUTE
Date: Thu, 09 Nov 2006 06:40:42 +0100
Message-ID: <20061109054042.267180@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi, 

I am new in iptables world - and after reading many discussions and studying iptables manpages etc. I am 
still missing a piece of puzzle to solve the following problem. 
I have a need to perform TOS based traffic routing. 
That means I have two interfaces (say eth0 and eth1) to backbone and I need to route the real-time critical 
IP traffic over eth1 and the remaining IP traffic over eth0. 
After a lot of experimenting I came to the conclusion that something like the following would do: 

# iptables -t mangle -A POSTROUTING -m tos --tos  16 -j ROUTE --oif eth1 
# iptables -t mangle -A POSTROUTING -m tos --tos !16 -j ROUTE --oif eth0 

Unfortunately the Linux box says: 
"No chain/target/match by that name" 

The kernel I use is 2.6.18, iptables version is the last debian stable version 1.2.11. 

Any idea what is wrong here (am I missing something in the configuration, or a library, or am I completely wrong maybe…)?

Thanks for any help. 

Br. 
Mato 

-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal für Modem und ISDN: http://www.gmx.net/de/go/smartsurfer

