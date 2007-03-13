From: Petr Pisar <xpisar@fi.muni.cz>
Subject: Re: Fwd: Routing to and from an IP on an interface
Date: Tue, 13 Mar 2007 10:28:47 +0000 (UTC)
Message-ID: <slrnevcv6v.610.xpisar@album.ics.muni.cz>
References: <1173760381.45f6297d9a03d@mail.dreamtoy.net>
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

On 2007-03-13, Nathan @ Netdigix Systems <lists@netdigix.com> wrote:
> Hi I have an issue where the internal interface wants to always talk
> from the primary ip address,  what kind of rule can I add to make the
> traffic comming from a specific source ip leave the router interface
> from a specific secondary ip address?
>
Source IP address, if not specified by bind(2), depends on routing
table.

You can add rule which specifies source address explicitly like this:

ip route add default via <MY_GW> dev <OUT_DEV> src <SRC_IP>

Maybe, the dev part is optionable.

-- Petr


