From: Christian Hammers <ch@westend.com>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: Tue, 14 Jan 2003 17:37:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114163734.GB19620@westend.com>
References: <20030114093711.GC9940@westend.com> <20030114121232.GA3362@westend.com> <1042551825.465.143.camel@xbox> <20030114150641.GB23431@westend.com> <1042559354.464.770.camel@xbox> <20030114160134.GC6664@westend.com> <1042560593.464.862.camel@xbox>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1042560593.464.862.camel@xbox>
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
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

On Tue, Jan 14, 2003 at 05:09:53PM +0100, Filip Sneppe wrote:
> On Tue, 2003-01-14 at 17:01, Christian Hammers wrote:
> > Yes, thought so, too. - The question that I was trying to ask in this
> > thread was, why the /proc/net/ip_conntrack is filled by the kernel
> > although I *already did* remove the module!
>=20
> What kernel version are you running ? modutils version ?
Kernel-2.4.20. modprobe-2.4.15. Debian 3.0 woody distribution.

> Is this reproducable upon every reboot ?
I'm not allowed to reboot it :-) But it's still reproducible that=20
after decreasing with about 1000 per minute the value of
/proc/net/ip_conntrack has now stabilized around the
/proc/sys/net/ipv4/ipt_conntrack_max value which is currently 10000=20
(was 65520 and filled up to ca. 50000)

> I've been giving it a few tries on my machine, and=20
> ip_conntrack disappears nicely from /proc/net upon
> unloads/reloads of ip_conntrack, even
> with unreplied connections pending.
Hmm :)=20
Maybe you should set your machine unter a load of at least 4mbit/s=20
with random IPs. This was the amount of traffic my router had when I
reloaded the firewall rule script with a "rmmod" at the beginning.

bye,

-christian-

--=20
Christian Hammers             WESTEND GmbH  |  Internet-Business-Provider
Technik                       CISCO Systems Partner - Authorized Reseller
                              L=FCtticher Strasse 10     Tel 0241/701333-11
ch@westend.com                D-52064 Aachen              Fax 0241/911879


