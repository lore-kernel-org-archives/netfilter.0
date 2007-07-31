From: Klaus Wacker <klaus_gr_W_kl_Acker@web.de>
Subject: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 11:24:44 +0200
Message-ID: <1529899887@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

>> How to get iptables into a ppc kernel (2.6, netfilter
>> enabled) and where to store what to have functionality from the
>> start=3F I used NO=5FSHARED=5FLIBS=3D1
>> I am able to download start the kernel, but do not find iptables.
>=20
> AFAIK you cannot.
> Iptables is a *user*space utility to configure the Netfilter framework
> and I don't see how you'd compile that into the kernel.
>=20
>=20
> Rob
>=20
>=20
> Ok, I am a little confused with kernel modules. Anyhow I would like to
> do something like this here (from the install):
> "
> 4) If you want to build a statically linked version of the iptables
>    binary, without the need for loading the plugins at runtime (e.g.
>    for an embedded device or router-on-a-disk), please use
>=20
> 	% make NO=5FSHARED=5FLIBS=3D1
> "
>=20
> and I get a rather large executable binary (700kB). But I
> can't execute this nor do I know how to make it run inside my target.
> Klaus

>This is something different from compiling things "into" the kernel.
>You've just built a statically linked iptables binary: those binaries
>don't need external libraries, which is why they are larger because the
>functionality in the libraries must be present in the binary to actually
>make it standalone.

>So, you still get a binary called iptables which must be run from some
>shell (I guess).


>Rob

Yes, did that and then I try to run it but it only says "cannot execute bi=
nary file"
even I can execute other files.
Klaus



=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Jetzt neu! Sch=FCtzen Sie Ihren PC mit McAfee und WEB.DE. 3 Monate
kostenlos testen. http://www.pc-sicherheit.web.de/startseite/=3Fmc=3D022220


