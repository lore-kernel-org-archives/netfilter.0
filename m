From: "__ Radien__" <radien@zworg.com>
Subject: Re: to use or not to use stateful capabilities
Date: Tue,  6 Apr 2004 23:27:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9433.1081319277@zworg.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Thx Cedric

and this is my experience
---------------------------------------

#!/bin/bash
#

#Interfaces
IF0=3D'192.168.0.67'
IF1=3D'192.168.10.67'

#LAN's
LAN0=3D'192.168.0.0/24'
LAN1=3D'192.168.10.0/24'

###############################################
#Flush all the tables
service iptables stop

#or this one
#iptables -F OUTPUT
#iptables -F FORWARD
#iptables -F INPUT

#allow everything go through
iptables -P INPUT DROP
iptables -P OUTPUT DROP

#suite 1  //Does not worksfor data connection
#iptables -t filter -A FORWARD -i eth0 -o eth1 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
#iptables -t filter -A FORWARD -i eth1 -o eth0 -p tcp --dport 21 -j
ACCEPT

#suite 2 //works for passive and active data connection=20
#iptables -t filter -A INPUT -i eth0 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
#iptables -t filter -A OUTPUT -o eth0 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
#iptables -t filter -A INPUT -i eth0 -p tcp --dport 21 -j ACCEPT

#suite 3  //Does not worksfor data connection
#iptables -t filter -A INPUT -i eth0 -p tcp -m state --state
NEW,RELATED,ESTABLISHED --dport 21 -j ACCEPT

#suite 4  //works for active data connections
#iptables -t filter -A INPUT -i eth0 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
#iptables -t filter -A OUTPUT -o eth0 -p tcp -m state --state
ESTABLISHED -j ACCEPT
#iptables -t filter -A INPUT -i eth0 -p tcp --dport 21 -j ACCEPT

#suite 5  //works for passive data connections
iptables -t filter -A INPUT -i eth0 -p tcp -m state --state ESTABLISHED
-j ACCEPT
iptables -t filter -A OUTPUT -o eth0 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A INPUT -i eth0 -p tcp --dport 21 -j ACCEPT


Cedric Blancher <blancher@cartel-securite.fr> wrote:
>=20
> Le mar 06/04/2004 =E0 09:01, __ Radien__ a =E9crit :
> > ByTheWay, about ftp service, do u mean that w/ iptables I can set such
> > rules that can detect and pass the data connection corresponding to
> > existing control-connection further than ordinary accepting
> > control-conneciton to fwd.
> > Does RELATED state match such cases?
>=20
> Yes.
> For FTP, the date connection first packet will have RELATED state, for
> it complies to informations that were gathered within control connection
> by ip_conntrack_ftp module, allowing you to match and accept it.
>=20
> --=20
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!
>=20



But, what does RELATED state good for other services? what is it's
application?

Regards
__Radien__

