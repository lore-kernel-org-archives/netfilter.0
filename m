From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Few questions re: firewalling capabilities of iptables..
Date: Tue, 7 Feb 2006 15:17:38 +0100 (CET)
Message-ID: <64678.193.173.147.3.1139321858.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Tue, February 7, 2006 14:36, Toby Bradshaw wrote:
> Folks,
>
> I have a few questions regarding the firewalling capabilites of
> iptables. If this isn't the correct place to ask such things  then
> please accept my apologies and point me in the right direction.

<snip>

> We're using STUN to perform NAT traversal. STUN makes a distinction
> between cone and symmetric NAT's (so I'm told) and it would be nice to
> be able to set up examples of each within this test network:
>
> 1) What kind of NAT is iptables ?
> 2) Would it be possible (from rootland) to simulate the other kind ?
> 3) If any of these questions seem dumb.. what have I not understood ?

If :
- cone nat =3D NAT "many" IP's to 1 IP, and
- symmetric nat =3D NAT "many" IP's to "many" IP's, then

cone NAT would be the SNAT target and symmetric NAT would be the NETMAP t=
arget.
Seems to me iptables can do both unless there's something I'm misundersta=
nding
(please correct me if I'm wrong).

See also :
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-NE=
TMAP
and "man iptables".


Gr,
Rob



