From: xchris <lyra@fastwebnet.it>
Subject: Re: Blocking Squid Requests
Date: Wed, 7 May 2003 21:27:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305072127.03670.lyra@fastwebnet.it>
References: <001801c31490$fd031670$7107a8c0@maninho>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001801c31490$fd031670$7107a8c0@maninho>
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
Cc: Walter Priesnitz Filho <walterp@via-rs.net>

On Wednesday 07 May 2003 14:05, Walter Priesnitz Filho wrote:
> Hi,
> I have this environment, a subnetwork (192.168.0.0) that access another
> subnetwork (192.168.59.0) and then access the internet. The second lan =
has
> a proxy server (squid:3128).
> I need to block the requests in th first lan to the squid server to som=
e
> sites. How can I do this?
> I've tried this
> iptables  -A FORWARD -p tcp -m multiport --dport 80,443,3128 -d
> www.someplace.com -j DROP
> but doesn't work.
> Can anybody help-me?

why don't use OUTPUT/INPUT  chain?=20
you disable output/input from the lan to your firewall (so squid doesn't =
get=20
requests)

bye
xchris



