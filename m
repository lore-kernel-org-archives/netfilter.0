From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: mac/ip match
Date: Thu, 18 Sep 2003 21:17:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063912619.845.11.camel@elendil.intranet.cartel-securite.net>
References: <1063909559.19096.12.camel@tux>
	 <1063911472.844.7.camel@elendil.intranet.cartel-securite.net>
	 <1063911877.19096.16.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063911877.19096.16.camel@tux>
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
To: "M. Ziya Ozudogru" <e116132@metu.edu.tr>
Cc: netfilter@lists.netfilter.org

Le jeu 18/09/2003 =E0 21:04, M. Ziya Ozudogru a =E9crit :
> Thanks for your help but how can i assure that given mac is using the i=
p
> i assign to it? And if it is using its assigned ip it should pass if it
> is not it should be blocked

If all your rules are this kind :

	iptables -A FORWARD -m mac --mac-source $MAC -s $IP -j ACCEPT

Then an unknown MAC address won't be able to get through and a known one
will accepted _only_ if used with correct source IP. Isn't it what you
wanted or am I missing something ?

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

