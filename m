From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: hosts.deny
Date: Mon, 8 Jul 2002 09:03:40 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA264@JUPITER>
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
To: 'Dennis Cardinale' <dennis@core-enterprises.com>, Netfilter Mailing List <netfilter@lists.samba.org>

Use it as a precaution.. if that HOST.DENY runs... then you have an
intrusion which you need to fix..

I do this..

vi /etc/hosts.deny
#---------------------
ALL:            ALL : spawn (/bin/hosts.deny.script %d %a %h) &
#---------------------

Every deny spawns my script, my script determines if it's a true attack and
can take counter measures like email me and then shutdown the firewall
etc.etc..

BUT YOU HAVE TO MAKE SURE IT'S AN INTRUSION!

Other ways is to run snort or portsentry and others.. I'm happy with my
script.. it's activated once only because I forgot to allow my VPN user to
get through... ;) Oops.. Blocked him for a while..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Dennis Cardinale [mailto:dennis@core-enterprises.com]
Sent: Monday, 08 July 2002 8:54 AM
To: Netfilter Mailing List
Subject: hosts.deny


When running a netfilter firewall, is there any reason to continue using the
hosts.deny and hosts.allow files, or is this just superfluous?

Thanks,

Dennis


