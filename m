From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: NAT addresses - RFC or tradition?
Date: Tue, 22 May 2007 12:26:07 -0700
Message-ID: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
References: <46533B98.9030706@riverviewtech.net>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46533B98.9030706@riverviewtech.net>
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

I've noticed that a lot of people use the 192.168.X.X subnet for =
internal
networks, is this (and the less-used 10-series) a requirement of some =
RFC,
or a recommendation that has become tradition?

We are using a completely different subnet, something similar to (for
example) 42.127.129.X to further obfuscate the internal network from
outside. This, and many other examples, produces a class-A subnet mask =
(some
produce a class-B) when entered in WinXP's TCP/IP dialog, although the
actual mask we use with it is class-C.

Is this a no-no? Will it break our server's IPTables when communicating =
with
it? Am I in for a lot of trouble? The addresses don't seem to cause any
problems, but I don't want this to jump up and bite us in the bottom
sometime down the road.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9


