From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: voice based queuing
Date: Tue, 2 Jul 2002 13:25:41 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1CB@JUPITER>
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
To: 'ganesh kumar godavari' <gkgodava@rediffmail.com>, lartc@mailman.ds9a.nl, netfilter@lists.samba.org
Cc: Stef Coene <stef.coene@docum.org>

You can't unless you expect it to run on certain ports that you KNOW which
port it uses..

As someone on the list mentioned before:
    389       Internet Locator Server (TCP)
    522       User Location Server (TCP)
    1503      T.120 (TCP)
    1720      H.323 call setup (TCP)
    1731      Audio call control (TCP)

Anybody can hack a VoIP program to use another port and your rules would be
stuffed. You'd have to support certain VoIP ports and then build your TC
over that.

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: ganesh kumar godavari [mailto:gkgodava@rediffmail.com]
Sent: Tuesday, 02 July 2002 1:10 PM
To: lartc@mailman.ds9a.nl; netfilter@lists.samba.org
Cc: Stef Coene
Subject: voice based queuing


hello group,

    i want to know if there is any way i can determine using 
iptables if the ip packet contains voice?

  i want to know this as i want to do some queuing for output 
packets and the voice packets are given high preference next 
ftp,telnet,ssh.....


i want to know if this is possible using iptables and tc. if so 
how. if i can identify the packet to be voice then i can do the 
rest using tc.

thanks
ganesh
_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


