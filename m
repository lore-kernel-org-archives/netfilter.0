From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Re: AW: GRE/PPTP Conntrack
Date: Mon, 23 Aug 2004 12:08:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408231208.25955.pandre@darkstar.nom.za>
References: <94F30CDB27E39547A10F4E71E9AF114B2DF2AF@dlb-dc02.intern-eviatec.de> <200408231109.41376.pandre@darkstar.nom.za> <1093253528.2423.12.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093253528.2423.12.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

On 23/08/2004 11:32, Cedric Blancher wrote:
> Le lun 23/08/2004 =E0 11:09, Paulo Andre a =E9crit :
> > The only 2.4 kernel that I have on that server is 2.4.18, what p-o-m
> > could I use to patch it for PPTP, been on netfilter site and there are
> > alot of p-o-m options to download.
>
> You can use the last one.
>
> > While I am sorting this out should I upgrade iptables to 1.2.11?
>
> Using patch-o-matic means a kernel rebuild, and most of the time, some
> stuff to add for iptables. So you may ipgrade to 1.2.11 at the same
> time.
>
> =3D> lastest pom, latest iptables.

I have tried patching and get the following:

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
Testing patch extra/pptp-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
   Placed new Makefile line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.

Anyone know what could be wrong, any suggestions?

Paulo


