From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Problem with passiv FTP
Date: Wed, 25 Feb 2004 13:31:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567918C@alderaan.smgtec.com>
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
To: Christian Gmeiner <christian@visual-page.de>, netfilter@lists.netfilter.org


Run these shell commands at boot, or any time before you want FTP to
work properly
	modprobe ip_conntrack_ftp
	modprobe ip_nat_ftp

For the an FTP server on the firewall itself, use
	# Allow anyone to inbound to the FTP server
	iptables -A INPUT -p tcp --dport 21 -j ACCEPT
	# ALWAYS HAVE THIS RULE & FIRST IN LIST
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

For machines behind your firewall connecting to the internet, use
	# You should tighten up this rule a bit specifying -i
<internal_interface_address> as well as the following
	iptables -A FORWARD -p tcp --dport 21 -j ACCEPT
	# ALWAYS HAVE THIS RULE & FIRST IN LIST
	iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
ACCEPT

For internet clients connecting to an internal server, use
	# This forwards the FTP request to the right internal FTP server
	iptables -t nat -A PREROUTING --destination
<external_ftp_address> -p tcp --dport 21 -j DNAT --to
<internal_ftp_server>
	# Allow traffic to DNAT'd IP address
	iptables -A FORWARD --destination <internal_ftp_server> -p tcp
--dport 21 -j ACCEPT
	# ALWAYS HAVE THIS RULE & FIRST IN LIST
	iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
ACCEPT

That is all!

PS: Never fck around with OUTPUT unless you're a pro.
FORWARD goes through the firewall INPUT/OUTPUT are just for local
firewall PC connections.


Christian Gmeiner wrote:
> Hi people.
>=20
> I got active FTP working, but i also need the passive one.
>=20
> Here is my stuff:
>=20
>     # Port 21
>=20
>     iptables -A INPUT     -p tcp --sport 21 -m state --state
>     ESTABLISHED -j ACCEPT iptables -A OUTPUT -p tcp --dport 21 -m
> state --state NEW,ESTABLISHED -j ACCEPT=20
>=20
>     # aktiv - works
>     iptables -A INPUT     -p tcp --sport 20 -m state --state
>     ESTABLISHED,RELATED -j ACCEPT iptables -A OUTPUT -p tcp --dport
> 20 -m state --state ESTABLISHED -j ACCEPT=20
>=20
>     # passiv
>     iptables -A INPUT     -p tcp --sport ${UNPRIVPORTS} --dport
>     ${UNPRIVPORTS}  -m state --state ESTABLISHED -j ACCEPT iptables
> -A OUTPUT -p tcp --sport ${UNPRIVPORTS} --dport ${UNPRIVPORTS}  -m
> state --state ESTABLISHED,RELATED -j ACCEPT =20
>=20
> I have everything set to drop and i am alowing this protocols and
> ports:=20
>=20
> # TCP in+out
> #
> #
> TCP_IN_OUT=3D"ssh"
>=20
> # TCP out
> #
> # 5190 =3D ICQ
> #
> TCP_OUT=3D"5190 http https 25 ftp ftp-data pop3 smtp"
>=20
> # TCP in
> #
> TCP_IN=3D""
>=20
> # UDP in+out
> #
> UDP_IN_OUT=3D"domain ssh"
>=20
> # UDP out
> #
> #
> UDP_OUT=3D"https"
>=20
> # UDP in
> #
> UDP_IN=3D""
>=20
> UNPRIVPORTS=3D"1024:65535"
>=20
> So.. i must now allow the UNPRIVPORTS, but how i am doing this?
>=20
> Thanks, Christian Gmeiner

