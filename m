From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Reject Mac-Address
Date: Fri, 1 Aug 2003 19:15:15 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDKEDENFAA.georgev@citadelcomputer.com.au>
References: <1059724368.1178.9.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059724368.1178.9.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>, Leonardo Pires <leonardo@nextwave.com.br>
Cc: netfilter@lists.netfilter.org

Hey, don't forget.. the firewall will only see the MAC of the routers (fr=
om
experience) unless the routers pass the MAC address across when routed...
but AFAIK they don't.. so -m mac is useless in this scenario...


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Cedric Blancher
Sent: Friday, August 01, 2003 5:53 PM
To: Leonardo Pires
Cc: netfilter@lists.netfilter.org
Subject: Re: Reject Mac-Address


Le ven 01/08/2003 =E0 05:20, Leonardo Pires a =E9crit :
> I have the following scenario:
> internet--router---firewall---router---clients
> I have the mac_address of all clients, and I need to reject some
> clients in the firewall  using the mac_address, someone know how can I
> do  it ?

You will do source MAC address based filtering. Use mac match :

cbr@elendil:~$ iptables -m mac --help
iptables v1.2.7a
[...]
MAC v1.2.7a options:
 --mac-source [!] XX:XX:XX:XX:XX:XX
                                Match source MAC address

Suppose you want to deny access to a host considering its MAC address :

	iptables -A FORWARD -m mac --mac-source $FORBIDEN_MAC -j DROP

--
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE



