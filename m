From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: ebtables v/s arptables
Date: Wed, 20 Jun 2007 14:33:27 +0000 (UTC)
Message-ID: <slrnf7ieln.83n.petr.pisar@album.ics.muni.cz>
References: <d41814cf0706130120x5609dfc2o285a07ceda1ba21b@mail.gmail.com>
	<1181755998.2976.1.camel@localhost.localdomain>
	<d41814cf0706140125i52cef5a6u6e73ab3395290e35@mail.gmail.com>
	<1181837804.2972.16.camel@localhost.localdomain>
	<d41814cf0706142221u735ff9a8v1b1debf802c3f400@mail.gmail.com>
	<Pine.LNX.4.64.0706150833230.27797@fbirervta.pbzchgretzou.qr>
	<d41814cf0706142341m427b0c56p6ade6d2f3925cd15@mail.gmail.com>
	<Pine.LNX.4.64.0706150855530.27797@fbirervta.pbzchgretzou.qr>
	<d41814cf0706180517v58e4aa98r687e6ee957524c25@mail.gmail.com>
	<4678C3F1.5000804@plouf.fr.eu.org>
	<d41814cf0706200426n3a78297elf53733b29791e261@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2007-06-20, pankaj jain <jainp1979@gmail.com> wrote:
> On 6/20/07, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Plumbing means I did not assign the IP 203.200.192.24 to any of my
> interfaces, instead I was using arptables to respond the arp requests
> for this IP.
> The gateway exists on the same subnet but because I did not assign the
> IP to any of my interfaces, ip route rejects the gateway add command.
> but now I understood that first I had to add the network route for that gateway.

Or use "dev DEVICE onlink" suffix:

ip route add default via 203.200.192.1 dev eth0 onlink

-- Petr


