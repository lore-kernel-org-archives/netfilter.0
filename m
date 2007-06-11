From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: iptables state transfer
Date: Mon, 11 Jun 2007 11:22:47 +0000 (UTC)
Message-ID: <slrnf6qc46.71g.petr.pisar@album.ics.muni.cz>
References: <e208f5d10706110355o42796f61va19167b7ac2282b6@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On 2007-06-11, Martin Schi=F8tz <malinux@gmail.com> wrote:
>
> Can iptables do state transfer between two firewalls for failover
> purpose. Something like PF sync with PF in BSD.
>
> I want to do NAT with failover.
>

Try conntrack-tools
http://people.netfilter.org/pablo/conntrack-tools/

-- Petr


