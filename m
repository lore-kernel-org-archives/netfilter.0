From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: allowing certain IP addresses.
Date: 17 May 2003 09:27:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053156472.804.5.camel@elendil.intranet.cartel-securite.net>
References: <75634F04BFCFD511BF69009027DC8649484265@mailman.thenap.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <75634F04BFCFD511BF69009027DC8649484265@mailman.thenap.com>
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
To: Drew Weaver <drew.weaver@thenap.com>
Cc: netfilter@lists.netfilter.org

Le sam 17/05/2003 =E0 08:26, Drew Weaver a =E9crit :
> I would like to disclude a /25 from accessing a server except for 1 ip
> address on that /25 this is what I have in my rules.
> /sbin/iptables -A INPUT -i eth0 -s 10.1.0.0/25 -j DUMP
> /sbin/iptables -A INPUT -i eth0 -s 10.1.0.52/32 -j ACCEPT
> the blocking works, the 10.1.0.0/25 network cannot reach this server,
> however the 10.1.0.52/32 cant either.

You just have to place second rule before the first one :

	iptables -A INPUT -i eth0 -s 10.1.0.52/32 -j ACCEPT
	iptables -A INPUT -i eth0 -s 10.1.0.0/25 -j DUMP

Than, 10.1.0.52 is accepted and the reste of 10.1.0.0/25 is denied. In a
general way, when you have group exclusion issues, you have to place
most specific rules first.

> I have one other question, this skeleton script I downloaded has these:=
=20
[...]
> listed as unroutable, or private ip addresses but I know some of these =
are
> actually being used on the net, NOW months after the skeleton was writt=
en,
> anyone know or know how to find out which ones I should remove?

Blockin IANA reserved blocks can be a good idea, but it requires
frequent checking. You'll have to whois all theses blocks and remove
each that does not appears as RESERVED, such as 201.0.0.0.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

