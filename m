From: Chris <mlists@aon.at>
Subject: Allowing limited broadcasts between LAN <-> DMZ?
Date: Tue, 25 Jun 2002 11:27:56 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D18379C.B101AA83@aon.at>
References: <Pine.LNX.4.33.0206251044140.4927-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,


i am wondering if it would be a security risk to generally allow ALL
limited broadcasts (255.255.255.255)?!

We have a heterogenous network with Linux (Firewalls, Mail/Proxy/Time/
etc-server), WinNT/W2k Clients & Servers and one AS/400 as server.
Now there is our internal firewall between the LANs and the DMZ.
At the moment i am blocking limited broadcasts, which breaks the 
functionality of some windows stuff (SQL-Server, NetBIOS, SMB, ...).
So i allow this traffic "manually" with adding according rules to the
internal firewall.

Why am i blocking the limited broadcast? Because i was sniffing around
and found several "example scripts" which do this. The question is
if this is REALLY necessary and if someone could exploit a not blocked,
limited broadcast?

Just yesterday we connected a printer to our LAN, and now it is sending
limited broadcasts to UDP port 123?!? (it want's to know the time?? :))
However, it's kind of annoying to see those entries in the logfile now
every five minutes.. sure i could allow/drop this without logging,
but the question is - again :) - can't i just allow ALL limited broad-
casts on the internal firewall?

	
		regards, Chris


