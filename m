From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: eDonkey - DNAT not working
Date: Thu, 4 Jul 2002 15:04:40 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA220@JUPITER>
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

ha ha.. dumping something (rythms fogive me)

What you'll find is either the logs are showing something you've missed (UDP
instead of TCP etc.etc. ) or there is another port not ruled in when it
should..


thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: George Vieira 
Sent: Thursday, 04 July 2002 2:58 PM
To: 'Christian Hubinger'; netfilter@lists.samba.org
Subject: RE: eDonkey - DNAT not working


tcpdump your packets coming in
also are you logging all dropped packets and if not, you better otherwise
it's probably something something else as well....

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au

