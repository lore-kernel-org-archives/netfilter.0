From: "Jason Opperisano" <Jopperisano@mailhost.alphanumeric.com>
Subject: RE: Routing, SNAT and two ISPs
Date: Tue, 10 Aug 2004 08:15:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905125E@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> Well, it's seams to be a little bit more complicated than
> I thought to loadbalance Internat connection between 2 (different) ISP
> lines ...
>
> Here is my problem:
>
> Basically, I need to connect my office to 2 differents ISP (different
> gateways and different DNS ). My linux box is a 3 NICs Box. The =
problem
> is that, for the first ISP, I don't have static Addresses.
>
> So, I would like to loadbalance, "route" and NAT all my internals =
Addresses
> through thoses 2 ISP except for some addresses and some port numbers
> which will use
> only the ISP2.

have a look at:
	http://linux-ip.net/html/adv-multi-internet.html

-j

