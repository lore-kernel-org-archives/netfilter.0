From: <bmcdowell@coxhealthplans.com>
Subject: RE: Bridging firewall setup
Date: Tue, 16 Dec 2003 13:58:02 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731012C6471@coxhpexg.coxhp.com>
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
To: netfilter@lists.netfilter.org


This should be emphasized, as there seems to be a good deal of confusion =
about what's included in the kernel and what isn't.

1)  Bridging is included in the kernel
2)  Using iptables (or ebtables for that matter) to filter bridge =
traffic is not included and must be patched in.

Check out http://bridge.sourceforge.net/docs.html or =
http://ebtables.sourceforge.net/documentation.html for more details.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Richard Doyle
Sent: Tuesday, December 16, 2003 11:35 AM
To: netfilter@lists.netfilter.org
Subject: Re: Bridging firewall setup


On Tue, 2003-12-16 at 08:55, Chris Brown wrote:
> Hi all, new to the list. I'm trying to get a bridging firewall setup =
on=20
> a RH 9 box and I'm not having much luck. The bridge itself works fine=20
> but when I try to add rules using netfilter they seem to be ignored =
and=20
> packets I'm trying to block go on through. I've been digging through =
the=20
> list archives, google, various forums and HOWTOs and I still haven't=20
> found the answer so I'm hoping someone here can point out what I'm =
doing=20
> wrong :)
Did you patch the kernel to support this? The bridging code in the stock
2.4 kernels doesn't support firewalling,



