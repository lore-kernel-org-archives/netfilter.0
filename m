From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: opening port for SSH
Date: Wed, 14 Dec 2005 20:36:23 +0000
Message-ID: <20051214203623.GF21572@metastasis.org.uk>
References: <000001c600d3$c48640b0$0101000a@sterenborg.info>
	<uizoe3jefxt.fsf@false.linpro.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <uizoe3jefxt.fsf@false.linpro.no>
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

On Wed, Dec 14, 2005 at 06:39:26 +0100, Bj=F8rn Ruberg wrote:
> "Rob Sterenborg" <rob@sterenborg.info> writes:
>=20
> > > And, what's the means for "bindind the ssh server to a higher
> > > port"?
> >=20
> > A "higher port" means a portnumber somewhere above 1024.  Normally
> > ssh binds to port 22/tcp (see above). In sshd_config you can tell it
> > to bind to 49152 or something.
>=20
> The important thing to know about high and low ports is that on *nix
> systems, only the root user may bind a service to ports below 1024,
> while regular users can start any kind of service and making it
> available through TCP or UDP ports above and including 1024.
>=20
> Because you don't want to run the risk of your SSH server being
> replaced by some shady regular-user process which will gladly pick up
> your login credentials, the smart thing is to bind services like SSH
> to ports below 1024.

In order to bind to the correct port wouldn't the existing SSHD process
need to be killed?  Or at least redirected to listen on another port so
the "shady" process could act as an intermediary.  For that to happen
wouldn't the attacker need root privileges anyway?

--=20
morals are for little people
Jenny Solzer

