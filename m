From: "Random Person" <randomperson83@hotmail.com>
Subject: Forwarding in a NAT..
Date: Sun, 22 Sep 2002 09:53:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F41jLlmNI5aIptmMWNC00006c22@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org


Yeah.. my question didn't make any sense.. Let me try again. Probably one o=
f=20
the situations that you said apply here, but just to make sure:

External addr (eth0): xxx.xxx.78.48
Internal addr (eth1): 192.168.0.1
Addresses on LAN: 192.168.0.2-192.168.0.30
Protocols used: tcp,udp

Lets assume a packet destined for xxx.xxx.3.3:123 arrives at eth0. Is there=
=20
a way for it to pass untouched into the LAN? (i.e. has the same dest. addr =

and source addr.). I know its seems impractical (at least for TCP), but it =

can be in some instances.



Visit my useless website at http://randomperson.cjb.net

-Your perception is reality until you control it...


_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com


