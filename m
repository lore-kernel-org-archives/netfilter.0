From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: passive mode ftp
Date: 23 May 2003 11:12:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053681137.673.14.camel@elendil.intranet.cartel-securite.net>
References: <3ECDE243.3133BBAA@nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3ECDE243.3133BBAA@nerim.net>
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
To: Eric Constantineau <mekanik@nerim.net>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le ven 23/05/2003 =E0 10:56, Eric Constantineau a =E9crit :
> I want to be able to use passive ftp under my firewall...

Use Netfilter conntrack functionnalities :

# modprobe ip_conntrack_ftp

[...]
> Is there a specific range of ports that all passive ftp use ?

Using FTP conntrack helper, you can spot data connections with RELATED
state. A setup setup could be :

	iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
		-j ACCEPT
	iptables -A FORWARD -m state --state NEW -p tcp -s $LAN \
		--dport 21 -o $EXTIF -j ACCEPT

Once a FTP connection is up, further packets are handled by ESTABLISHED
state rule, and connection data initiating is handled by RELATED state.

If you're using NAT, then you will need to modprobe ip_nat_ftp module.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

