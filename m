From: "hare ram" <hareram@sol.net.in>
Subject: Performanace fo the Iptables Server
Date: Wed, 27 Aug 2003 11:16:41 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019f01c36c5e$9f7868e0$c2bf09ca__27069.5053659894$1062120536@Housecall>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org
Cc: lartc@mailman.ds9a.nl

Hi all

I have RH 9.0
PIII with 550Mhz
512MB RAM

working fine with Iptables+TC+HTB

Now i want o make accounting system using ULOG

so i introduced  to send all logs to Mysql
So i can make my own Graphs

iptables -A INPUT -j ULOG
iptables -A FORWARD -j ULOG
iptables -A OUTPUT -j ULOG


the Server is connected to Several Clients

does this server will have any Impact of performance
or this PC can handle Easily

how can caluculate the PC configuration,

any help
hare

With


