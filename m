From: Christian Hubinger <a9806056@unet.univie.ac.at>
Subject: eDonkey - DNAT not working
Date: Thu, 4 Jul 2002 03:45:40 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207040345.41212.a9806056@unet.univie.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi!

I try to get my eDonkey Client running so I need to nat the address of my 
gateway to the local machine where the donkey client is running.

Here are my eDonkey IPTables lines:

$IPT -t nat -A PREROUTING -p tcp -m state --state NEW,RELATED,ESTABLISHED 
--dport 4661 -j DNAT --to-destination 192.168.0.2:4661

$IPT -t nat -A PREROUTING -p tcp -m state --state NEW,RELATED,ESTABLISHED 
--dport 4662 -j DNAT --to-destination 192.168.0.2:4662

$IPT -t nat -A PREROUTING -p udp -m state --state NEW,RELATED,ESTABLISHED 
--dport 4665 -j DNAT --to-destination 192.168.0.2:4665

when trying the test on this link
http://www.preinheimer.com/edonkey/serverlist/connectiontest.cgi

I allways get this error: 
error on ip 62.178.198.103!


I can't understand why this is not working as it sould exactly do what's 
written on the eDonkey website.

I'll be very thankfull for any help i can get.

greetings,
			chris
-- 
Windows is a 32 bit shell for a 16 bit extension to an 8 bit
Operating System designed for a 4 bit microchip by a 2 bit
company which can't stand one bit of cometition.


