From: "Tarek W." <mailinglists1@hotpop.com>
Subject: Re: Ip tables is not startting up FC1
Date: Fri, 19 Mar 2004 14:22:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079697794.2346.1.camel@carve.personal.localdomain>
References: <2577.128.59.176.161.1079019761.squirrel@sojourn.dyndns.org>
	 <1079451986.6656.7.camel@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079451986.6656.7.camel@casa>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tue, 2004-03-16 at 17:46, Alexandre Strube wrote:
> Em Qui, 2004-03-11 =C3=A0s 12:42, Technical escreveu:
> > When I reboot my box, iptables does not run.
>=20
> > if I service iptables start|stop iptables get start it.  I checked
> > chkconfig and iptables is on on run level 3 and 5.  what could be wrong;
> > which log can look into to see why ipatabels is not launching on reboot?
>=20
> This is a fedora-specific bug. I've already spoke about it here, no one
> heard. They kept asking me about generic solutions, none worked.

did u recompile iptables?! if yes, the path to iptables-save/restore
probably changed and /etc/rc.d/init.d/iptables has either been removed
or is reflecting the wrong path


