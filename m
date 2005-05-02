From: Dave Cinege <dcinege-mlists-dated-1115501355.b43282@psychosis.com>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Mon, 2 May 2005 17:29:10 -0400
Message-ID: <200505021729.10673.dcinege-mlists@psychosis.com>
Reply-To: dcinege-mlists@psychosis.com
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
To: netfilter@lists.netfilter.org
Cc: "Taylor, Grant" <gtaylor@riverviewtech.net>

On Wednesday 31 December 1969 18:59, netfilter-request@lists.netfilter.org=
=20
wrote:

> I'm going to presume that the different subnet's from your eth1 and your
> iptables rule 172.27.1.0/30 vs 172.27.0.0/30 was a typo.

I'm going to presume you saying 172.27.1.0/30 vs 172.27.0.0/30 was a=20
typo.  ;  ) I'm lazy in the code that generates these rules and I just use=
=20
ip/mask. iptables seems to be intelligent enough to round down to the netwo=
rk=20
address. It does seem to work....

# /sbin/iptables -t nat -I POSTROUTING -o eth1 -d 172.27.0.2/255.255.255.25=
2 \
=2Dj SNAT --to-source 172.27.0.2

# iptables -t nat -L -n
=2E..
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  0.0.0.0/0            172.27.0.0/30      to:172.27.0.2

> I'm not sure what to say. =A0I'm at a loss as to what might be causing
> problems. =A0At this point I would start sniffing as much traffic as I co=
uld
> on all the networks going in and out of devices that you are working with.
> =A0What you are trying to do looks reasonable to me. =A0I don't see any
> inherent flaws in what you are trying to do. =A0But that is just my eyes,=
 see
> what the rest of the list has to say.

Well I will see if adding a 'clamp-mss-to-pmtu' rule makes any difference.=
=20
Beyond that the next step is to build a unit and XP box and leave them=20
connected a few days until problems start. If problems start. I've yet to
see these issues in-shop at all.

Dave


