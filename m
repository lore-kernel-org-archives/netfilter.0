From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: internet gateway bandwidth control
Date: Fri, 21 Mar 2003 09:35:57 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF50C6FC1@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

This calls for TC. Go to http://lartc.org/

There is more than you ever wanted to know about it.

-----Original Message-----
From: realsite internetcafe [mailto:realsiteinternetcafe@yahoo.com]=20
Sent: Friday, March 21, 2003 8:18 AM
To: netfilter@lists.netfilter.org
Subject: internet gateway bandwidth control

hi all.

need help in formulating an iptables rule.

i need suggestion on a gnu/linux solution for my
internet gateway server sharing a adsl connection via
iptables_nat.

i got client that uses kazaa too much, but i dont want
to block kazaa i only need to retune it and give him
slow connection. problem is, i dont want to limit his
connection to the server coz the server is a samba
server also. only need to limit his kazaa connection.

heres the design:

if client bandwidth > 35kbps=20
then limit only to 35kbps
where kazaa dport and sport are 80 and 1214.
where -s 192.168.0.0/255.255.255.255.0 except
192.168.0.1 and 192.168.0.15 (.1 is the server and .15
is my box in my room, i believe i would be needing the
"!", but how do i make it for two ip address?)
where eth0 is 192.168.0.1 (LAN)
and
eth1 is 203.204.250.206 (DSL)

of course i know thats not the rule. but im having a
hard time formulating it. ive read all the netfilet
how-to's but i need to incorporate and thats the
problem.

or i need better suggestion.

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com


