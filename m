From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 19:14:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084209288.1804.13.camel@anduril.intranet.cartel-securite.net>
References: <1084206191.409fac6f1176a@webmail.floog.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084206191.409fac6f1176a@webmail.floog.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: michael@floog.net
Cc: netfilter@lists.netfilter.org

Le lun 10/05/2004 =E0 18:23, michael@floog.net a =E9crit :
> The LAN currently has 5 computers connected to it with static IP
> addresses:
> 192.168.1.2
[...]
> 192.168.1.6
> I will be adding 3 more machines with with static IP addresses:
> 192.168.1.7
> 192.168.1.8
> 192.168.1.9
> Issue:
> *.9 needs to remain accessible from *.7 and *.8; however, I need to
> restrict any connection or accessibility to *.9 from *.2 - *.6.

You can't restrict this kind of communication for it does not go through
your box. If you want to achieve this, then you have a Linux box a a
filtering bridge. Cheap quick recipe would be to add a third ethernet
interface to your box and configure it like this :

eth0 gos to the internet
eth1 goes to a switch where *.2 to *.6 are connected
eth2 goes to a switch where *.7 to *.9 are connected
create a bridge (br0) to which belong eth1 and eth2.
assign br0 former eth1 IP

Activate bridge filtering (available in stock 2.6 kernels) using
Netfilter and you're done. Just filter traffic in FORWARD chain, using
physdev match to specify eth1 and eth2 and incoming and/or outgoing
interface, and restrict traffic other than IP stuff using ebtables.

See http://ebtables.sourceforge.net/ documentation section.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

