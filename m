From: =?iso-8859-1?q?Mathias=20Koehrer?= <mathias_koehrer@yahoo.de>
Subject: iptable to pass (UDP)IP-broadcast from one LAN to another
Date: Tue, 28 Jan 2003 15:42:23 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030128144223.23892.qmail@web41002.mail.yahoo.com>
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

Hello everybody,

I have setup with a Linux PC and two LAN adapters.
One the first LAN, I have a subnet 192.168.10.0/24,
on the second LAN there is a subnet 192.168.11.0/24.

Using iptables and NETMAP I am able to pass messages
from the first LAN to the second and vice versa.
(E.g. 192.168.10.100 will be mapped to
192.168.11.100).
But so far I was not able to pass an UDP broadcast
(192.168.10.255) to the 2nd LAN as 192.168.11.255.
Neither filtering with -d 192.168.10.255 nor -d
0.0.0.255 worked...
ethereal and also iptable's LOG shows me that the
broadcast enters the PC - but it gets lost somewhere
between the two LAN cards...

What is wrong there?!?!? Any help is highly welcome!!!

Thanks

Mathias

=====
-- 
Mathias Koehrer - mathias_koehrer@yahoo.de

__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Bis zu 100 MB Speicher bei http://premiummail.yahoo.de

