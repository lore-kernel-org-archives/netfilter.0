From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: eDonkey - DNAT not working
Date: Thu, 4 Jul 2002 14:57:37 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA21F@JUPITER>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'Christian Hubinger' <a9806056@unet.univie.ac.at>, netfilter@lists.samba.org

tcpdump your packets coming in
also are you logging all dropped packets and if not, you better otherwise
it's probably something something else as well....

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Christian Hubinger [mailto:a9806056@unet.univie.ac.at]
Sent: Thursday, 04 July 2002 11:46 AM
To: netfilter@lists.samba.org
Subject: eDonkey - DNAT not working


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


