From: Cedric Blancher <blancher=cPThYx3uDionEikN29/hQkZa+K1vlBrA@public.gmane.org>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 12:49:15 +0200
Sender: ebtables-user-admin=5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Message-ID: <1054032554.681.103.camel@elendil.intranet.cartel-securite.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
	 <1054024461.694.31.camel@elendil.intranet.cartel-securite.net>
	 <1054028975.18150.65.camel@stilmant>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <ebtables-user-admin@lists.sourceforge.net>
In-Reply-To: <1054028975.18150.65.camel@stilmant>
Errors-To: ebtables-user-admin@lists.sourceforge.net
List-Help: <mailto:ebtables-user-request@lists.sourceforge.net?subject=help>
List-Post: <mailto:ebtables-user@lists.sourceforge.net>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request@lists.sourceforge.net?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=ebtables-user>
Content-Type: text/plain; charset="iso-8859-1"
To: ml-netfilter=LO0MmcUbMwyzQB+pC5nmwQ@public.gmane.org
Cc: netfilter=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, ebtables-user=5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

Le mar 27/05/2003 =E0 11:49, Michael Stilmant a =E9crit :
> On Tue, 2003-05-27 at 10:34, Cedric Blancher wrote:
> > What about a layer 2 SNAT on OUTPUT chain from B to A for filtered
> > packets ?
> > ebtables can achieve this.
> Well, I'll look in this solution. Thanks ...  so you say it's possible
> to make a filter in ebtables where I can say for all frame for ip:A por=
t
> X from port Y replace MAC with the #C value ?

Not directly, because ebtables cannot match TCP fields. But it must be
possible using fwmark propagation.

	iptables -t mangle -A OUTPUT -p tcp --sport Y -d A --dport X \
		-j MARK --set-mark 0x01

Then, you SNAT in POSTROUTING using ebtables marked packets :

	ebtables -t nat -A POSTROUTING -m mark_m --mark 0x01 \
		-j snat --to-source C_MAC

I must admit I did not tried this, but I do think it should work, as
long as output interface is a bridge (if not, packet won't go through
ebtables framework). You didn't get any other answer for this on
ebtables-user list ?


I Cc ebtables-user, so one can confirm what I said below ;)

--=20
C=E9dric Blancher  <blancher=cPThYx3uDionEikN29/hQkZa+K1vlBrA@public.gmane.org>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


-------------------------------------------------------
This SF.net email is sponsored by: ObjectStore.
If flattening out C++ or Java code to make your application fit in a
relational database is painful, don't do it! Check out ObjectStore.
Now part of Progress Software. http://www.objectstore.net/sourceforge
