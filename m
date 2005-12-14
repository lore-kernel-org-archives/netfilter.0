From: bjorn@ruberg.no (=?iso-8859-1?q?Bj=F8rn?= Ruberg)
Subject: Re: opening port for SSH
Date: 14 Dec 2005 18:39:26 +0100
Message-ID: <uizoe3jefxt.fsf@false.linpro.no>
References: <000001c600d3$c48640b0$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c600d3$c48640b0$0101000a@sterenborg.info>
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

"Rob Sterenborg" <rob@sterenborg.info> writes:

> > And, what's the means for "bindind the ssh server to a higher port"?
>=20
> A "higher port" means a portnumber somewhere above 1024.
> Normally ssh binds to port 22/tcp (see above). In sshd_config you can
> tell it to bind to 49152 or something.

The important thing to know about high and low ports is that on *nix
systems, only the root user may bind a service to ports below 1024,
while regular users can start any kind of service and making it
available through TCP or UDP ports above and including 1024.

Because you don't want to run the risk of your SSH server being
replaced by some shady regular-user process which will gladly pick up
your login credentials, the smart thing is to bind services like SSH
to ports below 1024.

--=20
Bj=F8rn


