From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Various questions
Date: Mon, 28 Jul 2003 08:59:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E0E@alderaan.smgtec.com>
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
To: =?iso-8859-1?Q?Ant=F3nio_Godinho?= <to@mail.isec.pt>, netfilter@lists.netfilter.org

A lot of the memory 'eating' in Netfilter is from storing runtime =
information about active connections when you are NATing connections, =
which I imagine you are.

To reduce the memory glut in Netfilter, I would say use less connections =
:-) or else limit the time that connections stay in the system. Mind =
you, if you shrink them too much, you will get dropped connections =
during normal operations.

I would say that 32MB is very limited. You may want to scalp any and =
everything else on the machine. You can save up a decent chunk of mem by =
just shutting down crap. For a firewall machine, this is pretty obvious.


Maybe I am not the best to describe this. I have a memory leak somewhere =
in my setup that leads to a reboot every month, and I have 256 MB.


