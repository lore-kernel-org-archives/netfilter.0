From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Routing decision?
Date: Mon, 15 Sep 2003 15:31:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063632718.932.71.camel@elendil.intranet.cartel-securite.net>
References: <3F657D37.1010000@able.be>
	 <1063616905.31092.78.camel@raylinux.internal>  <3F65981D.1060700@able.be>
	 <1063628083.31092.82.camel@raylinux.internal>  <3F65B63E.7030203@able.be>
	 <1063631398.31092.91.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063631398.31092.91.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Wim Ceulemans <wim.ceulemans@able.be>, Netfilter Mailing List <netfilter@lists.netfilter.org>, pieter@able.be

Le lun 15/09/2003 =E0 15:09, Ray Leach a =E9crit :
> I think that the aliases on the interface have something to do with it.

Nope.
When you DNAT an IP address that does not belong to your DNATing box,
there won't be anybody to answer prior router ARP requests on it, unless
you either set an alias up or tell this router that the IP as to get
routed through the DNATing box.

> I have had to add input and output rules in some situations to get DNAT
> to work the way it is supposed to (redirect to a different destination).
> It is strange.

Yes it is. I can get DNAT working without specifying any INPUT or OUTPUT
chain. Can you illustrate a situation for which you have to specify
INPUT and OUTPUT rules ?

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

