From: "Storm D. J. Petersen" <stormp@telus.net>
Subject: RE: linux-2.4.20 iptables-1.2.7a  DHCP on EXTIF
Date: Tue, 25 Feb 2003 17:01:15 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LKEMIKEDGPBEAFDKINCGIEJCEDAA.stormp@telus.net>
References: <20030221081303.15658.76956.Mailman@kashyyyk>
Reply-To: <stormp@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030221081303.15658.76956.Mailman@kashyyyk>
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

I have solved my own problem!

I am posting it because I've received a few private messages with people
suffering from the same symptoms.

I have Redhat7.3 base install and the default location of iptables is
/sbin/iptables*  and /lib/iptables/*

The default for iptables Makefile is to install to /usr/local/sbin/iptables*
and /usr/local/lib/iptables/*

Originally I had compensated for the executable path but not for the library
path.  As a result, I am assuming that iptables was using my old
iptables*.so's.


QUICK FIX:

#  cp /usr/local/sbin/iptables*  /sbin

#  cp /usr/local/lib/iptables/*    /lib/iptables

# iptables -version
iptables v1.2.7a

#  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

WORKS

Hope that helps anyone with the same problem.


-----Original Message-----
Message: 3
Reply-To: <stormp@telus.net>
From: "Storm D. J. Petersen" <stormp@telus.net>
To: <netfilter@lists.netfilter.org>
Subject: linux-2.4.20 iptables-1.2.7a  DHCP on EXTIF
Date: Thu, 20 Feb 2003 19:48:09 -0800


Hi,

I am still confused. ;-)

I upgraded my kernel to 2.4.20 and now  # iptables -t nat -A POSTROUTING -o
eth0 -j MASQUERADE  doesn't work.

However,  # iptables -t nat -A POSTROUTING -j SNAT -to $EXTIP    works!

My problem is that I am behind a cable modem that changes my IP address
daily.  So, what does one do if their eternal interface uses DHCP?
Thanks.
S.




--__--__--

Message: 4
Reply-To: <stormp@telus.net>
From: "Storm D. J. Petersen" <stormp@telus.net>
To: <netfilter@lists.netfilter.org>
Subject: linux-2.4.20 iptables-1.2.7a  DHCP on EXTIF
Date: Thu, 20 Feb 2003 20:05:03 -0800

Whoops should read:

However,  # iptables -t nat -A POSTROUTING -o eth1 -j SNAT -to $EXTIP
works!



-----Original Message-----
From: Storm D. J. Petersen [mailto:stormp@telus.net]
Sent: Thursday, February 20, 2003 7:48 PM
To: netfilter@lists.netfilter.org
Subject: linux-2.4.20 iptables-1.2.7a DHCP on EXTIF
Importance: High


Hi,

I am still confused. ;-)

I upgraded my kernel to 2.4.20 and now  # iptables -t nat -A POSTROUTING -o
eth0 -j MASQUERADE  doesn't work.

However,  # iptables -t nat -A POSTROUTING -j SNAT -to $EXTIP    works!

My problem is that I am behind a cable modem that changes my IP address
daily.  So, what does one do if their eternal interface uses DHCP?
Thanks.
S.






