From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: "selective" connection tracking?
Date: Fri, 31 Oct 2003 14:18:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067606301.4568.11.camel@elendil.intranet.cartel-securite.net>
References: <3F9EA786.5060401@otaku42.de>
	 <1067591422.812.13.camel@elendil.intranet.cartel-securite.net>
	 <3FA23DB7.3010300@otaku42.de>
	 <1067598149.4557.7.camel@elendil.intranet.cartel-securite.net>
	 <3FA252E2.4010304@otaku42.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA252E2.4010304@otaku42.de>
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
To: Michael Renzmann <mrenzmann@otaku42.de>
Cc: netfilter@lists.netfilter.org

Le ven 31/10/2003 =E0 13:17, Michael Renzmann a =E9crit :
> > You're able to do anything you want, as you have to explicitly implem=
ent
> > which traffic you do not want to track. Suppose your local IP is
> > A.B.C.D, then doing something like this should do the trick :
> > 	iptables -t raw -A PREROUTING -d ! A.B.C.D -j NOTRACK
> > Do this to exclude all traffic destined to local box.
> You mean "not destined to the local box", right? :)

I do mean "destined to the local box". You exclude from NOTRACK target
al traffic destined to the local box, meaning you include it in
conntrack ;)))

We do agree, for sure.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

