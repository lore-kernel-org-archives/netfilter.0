From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: One broadcast to many unicast NATing
Date: Tue, 30 Dec 2003 09:12:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679098@alderaan.smgtec.com>
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
To: "R. Lemos" <rslemos@hotmail.com>, netfilter@lists.netfilter.org


>Could not find any such a target (one in, many out) in iptables. Did I
miss=20
>something? Is there any other (software) way to do it?

There sure isn't a target that does what you need here. Your need is
quite niche IMHO. As an alternative, someone could write a small C
daemon that once it receives a directed unicast packet then sends that
packet off to the proper destinations. Once you have that built, just
redirect the broadcast UDP packet to the single host running you're
newly developed program.

To my reckoning, it should only be 200 lines of code max.

