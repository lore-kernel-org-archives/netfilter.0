From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: poptop connection problem
Date: 24 Oct 2002 21:17:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035487077.15747.0.camel@elendil>
References: <200210231602.00745.roy@karlsbakk.net>
	<200210231518.g9NFI4L02942@vulcan.rissington.net>
	<200210241245.52685.roy@karlsbakk.net>
	<200210241155.g9OBtEe04312@vulcan.rissington.net> 
	<005101c27b89$90256120$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005101c27b89$90256120$8c01a8c0@sundaram>
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
To: Sundaram Ramasamy <sun@percipia.com>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

Le jeu 24/10/2002 =E0 20:17, Sundaram Ramasamy a =E9crit :
> tcpdump -i eth0 proto 47 or port 1723
> the above command not showing any  information.=20
> my iptables command:
> iptables -A INPUT -i eth0 -p tcp --dport 1763 -j ACCEPT
> iptables -A INPUT -i eth0 -p 47 -j ACCEPT

There's a typo here !

iptables -A INPUT -i eth0 -p tcp --dport 1723 -j ACCEPT
					 ^^^^

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

