From: Alain Fauconnet <alain@cscoms.net>
Subject: ACK lost after SYN,SYN/ACK when DNATting to do transparent Squid proxy
Date: Wed, 19 Jun 2002 11:58:24 +0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020619115823.F26409@cscoms.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
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
To: netfilter@lists.samba.org

Hello -

I have a strange problem that has been bugging me for a long time.
I do transparent redirection to a separate Squid  box  from  a  2.4.18
kernel box using Netfilter, over a private LAN (10.254.254.0/24).
Something like:

iptables -t nat -A PREROUTING -i ppp+ -p  tcp -s 172.16.1.0/24 \
 --dport 80 -j DNAT --to 10.254.254.2:3128

Sometimes several times per hour, I observe that  ALL  connections  to
10.254.254.2:3128 just hang for 30s to 3min,  even  when  I  originate
them  from  the  Netfilter  box  itself  using telnet. Everything then
resumes normally. This is a major annoyance to the people behind these
boxes. Protocol analysis revealed the following:

Netfilter box      Squid box
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
----------- SYN --------->
<-------- SYN/ACK -------
. . . . . . ACK . . . . .> MISSING!

So  the problem is on the Netfilter box side, it never sends the final
ACK to the 3-way handshake.

I  have  tried   everything   I   could   think   of,   like   bumping
ip_conntrack_max up a lot (I have never seen the  connection  tracking
table full though), making  ip_local_port_range  wider,  playing  with
the SYN cookies options etc. No way. Nothing of interest found in syslog
or kernel messages.

Note that when any connection  to  port  3128  of  Squid  box   hangs,
connections to any  other  port,  including  other  ports  that  Squid
listens to (I have set it to listen to 8080 too for testing) work OK.

It looks much like a SYN queue filling up, but in this case it's
the *outgoing* part that "fills up" if that means anything on this
side, not the incoming SYN queue on the Squid proxy (because if it
were, I wouldn't see the SYN/ACK coming back).

More info, don't know if it's revelant to the problem:
- both boxes are Linux 2.4 kernels (.17 and .18 actually)
- Netfilter rules are rather open, defaults to ACCEPT, everything DROPped
is logged too and I can't find anything unusual in logs.
- people connect to  the  Netfilter  box  over  PPTP  (it  has  PoPToP
running)  using  private IPs tunneled in a real IP connection. Kind of
poor  man's  VPN  (it's  not  encrypted).  So  the global design is as
follows:

Client                  PPTP gateway

172.16.1.2 -----------> 172.16.1.1 (ppp interface)
      tunnelled over a PPTP link
      using real IPs

                  PPTP gateway

ppp interface --- PREROUTING --(non-HTTP)-> POSTROUTING -> eth0 -->
172.16.1.2        DNAT                      SNAT
                      |                           Goes to the Internet
                    (HTTP)                        source IP = IP of
                      | DNATed to Squid           PPTP g/w eth0
                      | proxy at 10.254.254.2
                  POSTROUTING
                  SNAT
                      | Goes to the Squid box
                      | source IP = IP of PPTP g/w eth1 = 10.254.254.1
                     eth1
                      |
                      V

                  Squid proxy
       IP = 10.254.254.2 on private LAN to PPTP g/w

Why the additional SNAT ? because I need the Squid box to route
back the web traffic through the PPTP gateway, not directly.
I cannot just set a route to 172.16.1.0 through 10.254.254.1 because
there are actually more than one PPTP gateways, each handling a number
of PPTP connections. So I can not tell to which one to route 172.16.1.2
in this case.

I know, it's a bit complicated :-) ... does this "missing ACK
in 3-way handshake" from a box doing DNAT to implement transparent HTTP
proxying to a Squid cache ring any bells ? Any help quite appreciated.

Greets,
_Alain_
--
Alain FAUCONNET
Sr. System Administrator
CS Communications Co. Ltd. - Thailand


