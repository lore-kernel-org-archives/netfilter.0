From: =?ISO-8859-1?Q?Eduardo_Fern=E1ndez?= <efgonzalez@gmail.com>
Subject: Two linux routers with DSL
Date: Thu, 6 Oct 2005 02:26:36 +0200
Message-ID: <fedfc260510051726r1832a75cnea267f8e5fd55a73@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Eduardo_Fern=E1ndez?= <efgonzalez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi all!

I've the following config:

[LAN] - [big router] - [dsl router] - [internet]

Big router is a dedicated computer running linux, dsl router is a
small device running linux embedded (busybox) and connected to the
internet via pppoa. Both routers are connected together via ethernet.
I want to reduce as much as possible the load in the dsl router, so
I'd like the big router to do NAT. How should I configure both
routers?

Thank you very much for your help!

Eduardo Fern=E1ndez

PS: this is somewhat offtopic, sorry

