From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: nmblookup
Date: Mon, 31 May 2004 21:44:55 -0700
Sender: samba-bounces+gnsg-samba=m.gmane.org@lists.samba.org
Message-ID: <200406010444.i514iteV023143@server5.bandwidthco.com>
References: <BAY15-F35VFu2mlWRFQ0002f375@hotmail.com>
Reply-To: markee@bandwidthco.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <samba-bounces+gnsg-samba=m.gmane.org@lists.samba.org>
In-Reply-To: <BAY15-F35VFu2mlWRFQ0002f375@hotmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/mailman/listinfo/samba>,
	<mailto:samba-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/archive/samba>
List-Post: <mailto:samba@lists.samba.org>
List-Help: <mailto:samba-request@lists.samba.org?subject=help>
List-Subscribe: <http://lists.samba.org/mailman/listinfo/samba>,
	<mailto:samba-request@lists.samba.org?subject=subscribe>
Errors-To: samba-bounces+gnsg-samba=m.gmane.org@lists.samba.org
Content-Type: text/plain; charset="us-ascii"
To: 'azeem ahmad' <azeem484@hotmail.com>, netfilter@lists.netfilter.org, samba@lists.samba.org

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of azeem ahmad
Sent: Monday, May 31, 2004 12:27 PM
To: netfilter@lists.netfilter.org; samba@lists.samba.org
Subject: nmblookup

hi all
when i start my firewall script it stops doing nmblookup. when this script
isnt running and i do #nmblookup host it resolves the name but whenever i
start the script it doesnt. what the problem can be i m using the script
below
----------------------------------------------------------------------------
---------------------------------------------------------
iptables -F
iptables -t nat -F
iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT iptables -A
INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT iptables -A INPUT -i
eth0 -p udp --dport 138  -j ACCEPT iptables -A INPUT -i eth0 -p tcp --dport
139  -j ACCEPT

----------------------------------------------------------------------------
---------------------------------------------------------

Regards
Azeem

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963

Take a look at this document. It should help you solve your problem:
http://www.linuxhomenetworking.com/linux-hn/samba-trouble.htm 



########################################################
This message has been scanned for viruses and dangerous 
content by MailScanner, and is believed to be clean.

postmaster@bandwidthco.com
MailScanner at bandwidthco.com is for your absolute protection.
########################################################

-- 
To unsubscribe from this list go to the following URL and read the
instructions:  http://lists.samba.org/mailman/listinfo/samba
