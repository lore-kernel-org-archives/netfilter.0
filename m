From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ip_conntrack for forwarded IPv4 packets
Date: Mon, 23 Aug 2004 14:03:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093262621.2423.28.camel@anduril.intranet.cartel-securite.net>
References: <082220042335.24480.41292DAE0008E7D600005FA02200750784C0C70E0C@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <082220042335.24480.41292DAE0008E7D600005FA02200750784C0C70E0C@comcast.net>
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
To: ca96@comcast.net
Cc: netfilter@lists.netfilter.org

Le lun 23/08/2004 =E0 01:35, ca96@comcast.net a =E9crit :
> Is it possible to do connection tracking only for packets that are
> locally terminated and not for packets that need forwarding? Since,
> connection tracking requires reassembling IP fragments, I wanted to
> know if there is any way to avoid reassembly in the forward path when
> connection tracking is enabled.

See raw table NOTRACK target within patch-o-matic :

	http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-raw


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

