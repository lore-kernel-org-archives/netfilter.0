From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Re-2: Is my script good and secure?
Date: Tue, 16 Mar 2004 10:16:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079428602.3349.14.camel@anduril.intranet.cartel-securite.net>
References: <DIIE.000000E400002A95@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000E400002A95@sbgit.com>
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
To: netfilter@sbgit.com
Cc: netfilter@lists.netfilter.org

Le lun 15/03/2004 =E0 15:32, netfilter@sbgit.com a =E9crit :
> I changed some rules, some rules are removed and the position of the ru=
les are
> changed. So i hope the script is more secure.

I did not see much change is the script you posted. I understand you may
not be familiar to Netfilter/iptables, but you could at least try your
scripts to see if they work...

> I wan't to use an separate file to be included like an blacklist of tra=
jan ports,
> but i'm very new with iptables (work since one week with it).
> How i have to build the rule do include an seperate file with near of 3=
51 entries of ports
> wich are used by trojans?
> How i have to build the file (like "65536   #Adore Worm/Linux" ??)



> iptables -N input_sperre
> iptables -N forward_sperre

I do not see the point in creating thoses chains. Just put the rules
directly in INPUT and FORWARD chains. Furthermore, you do not use theses
two chains in you script.

> iptables -A sperre -m state --state ESTABLISHED,RELATED -j ACCEPT

sperre chain does not exist anymore.

> iptables -A sperre -i eth1 --dport
> 22,19,21,22,25,3389,1723,23000:23001 -j ACCEPT # Allow outbound only
> for specific ports

Syntax error, see previous email.

> iptables -A sperre -i lo -s 127.0.0.1/255.0.0.0 -j ACCEPT              =
           # Allow everything from loopback

See previous email.

> iptables -A sperre -i eth0 -s 192.168.1.0/255.255.255.0 -j DROP        =
           # Drop everyting how comes fro outside to inside  with LAN IP'=
s

See previous email.

[...] Etc.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

