From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Possible huge iptables memory leakage
Date: Thu, 31 Jul 2003 13:14:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E14@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Peteris Krumins <newsgroups@lf.lv>, netfilter@lists.netfilter.org

I am not sure what everyone else's environments are like, but I am
definitely getting memory infinitely swallowed into Netfilter somewhere.
I have userspace programs, but put together they take less than 5% of
the system memory.

I forced myself to reboot once the ACTIVE memory takes 95% of the CPU,
which was every 3 weeks with 196mb of RAM. This server averaged 200 -
250 connection tracks during office hours. The ramping active memory
usage went up in a very linear pattern until it took all the system, at
which point I would have to reboot due to performance degradation.

The last reboot, I decided to play with the machine's settings and add
some memory totaling 256MB. I also disabled my SWAP partition because I
have a few database servers that perform fantastically when kswapd isn't
used much.=20

The result: Active memory 'seems' to have stabilized around 75MB at
least for the few days that it has been stable. I cannot tell if this
was totally kswap's fault, or even if the problem has been fixed at all.
It does look promising though.



