From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: iptables script file
Date: Mon, 25 Oct 2004 17:26:23 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410252121.i9PLLSJx072272@jkcpub.iserver.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Netfilter Group' <netfilter@lists.netfilter.org>

Hello everybody,

So far I have been writing all the iptables commands in a file & ran it in a
terminal (bash filename). Then I do the "service iptables save" to save &
load the configuration during boot-up. Pretty soon the configuration file is
going to have around 800 commands & this file is modified quite often. So
for the changes to reflect in run-time I do a "bash <script-file>".
Somewhere I read that loading that many commands using "bash <script-file>"
is not recommended (Is this true?). So I started searching in Google for
other alternatives. I came across the following:

- Use rc.firewall (I don't know if its in /etc or /etc/init.d or what)
- Use /etc/firewall.conf
- Use /etc/init.d/firewall

Could someone tell me which file to use? In Fedora core 2 I found only
/etc/rc.d/init.d/iptables.
Which way would be easy to load a huge script that would be modified quite
often?

OS specs:
Fedora Core 2
Kernel 2.6.8.1
Iptables 1.2.11

Hardware:
2.8Ghz P4
1 GB RAM

Thank you,

Deepak Seshadri


