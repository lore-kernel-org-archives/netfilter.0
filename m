From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 20:37:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063737473.786.73.camel@elendil.intranet.cartel-securite.net>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
	 <200309161256.15286.gdh@acentral.co.uk>
	 <1063716386.31093.160.camel@raylinux.internal>
	 <20030916131153.GA16559@cannon.eng.us.uu.net>
	 <1063720447.31093.166.camel@raylinux.internal>
	 <20030916141505.GB16559@cannon.eng.us.uu.net>
	 <plopm3isnshj1n.fsf@drizzt.kilobug.org>
	 <20030916155001.GE16559@cannon.eng.us.uu.net>
	 <1063731433.784.25.camel@elendil.intranet.cartel-securite.net>
	 <1063736564.2429.44.camel@ranjeet-pc2.zultys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063736564.2429.44.camel@ranjeet-pc2.zultys.com>
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
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, =?ISO-8859-1?Q?Ga=EBl?= Le Mignot <kilobug@freesurf.fr>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Le mar 16/09/2003 =E0 20:22, Ranjeet Shetye a =E9crit :
> I do believe that the 2.4 and 2.6 kernels contain an alternative NAT
> mechanism associated with the Config variable: CONFIG_IP_ROUTE_NAT
> This var is tied to CONFIG_NET_FASTROUTE and "Advanced Router" or
> something similar. Internally the source code uses flags like RTCF_NAT
> etc.
> This mechanism is incomptabile with the whole netfilter infrastructure.
> You MUST enable only ONE of the two mechanisms at any given time.
> Moreover I have not used this mechanism and dont know if it works and
> how well it works and what its limitations are.

See documentation at :

	http://www.suse.de/~mha/linux-ip-nat/diplom/nat.html

With 2.2 kernels, one was able to achieve simple NAT with iproute, but
it was far from flexible.

I must admit that, even if this option is activated into my kernel, I
don't use it at all.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

