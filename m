From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: cant connect to kernel.org behind firewall
Date: Sat, 8 Jul 2006 07:07:40 +0200 (CEST)
Message-ID: <1082.10.0.1.3.1152335260.squirrel@webmail.sterenborg.info>
References: <1152305262.7ca44f2ca1f53@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1152305262.7ca44f2ca1f53@webmail.harrisonburg.k12.va.us>
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
To: netfilter@lists.netfilter.org


On Fri, July 7, 2006 22:47, Dwayne Hottinger wrote:
> Sirs,
> I read the FAQ on kernel.org and they have the following:
> Please note that kernel.org uses Explicit Congestion Notification (ECN)=
, as
> defined in RFC 3168. Some broken firewalls or gateways may have problem
> connecting to ECN-enabled servers. Please contact your firewall or gate=
way
> vendor for necessary updates.
>
> How can I get around this (short of replacing my firewall), if this is =
the
> issue of why I cant connect to kernel.org?  Also how can I check if thi=
s is my
>  problem?

On your end you can disable ECN by:
cat 0 > /proc/sys/net/ipv4/tcp_ecn

I don't think you can make kernel.org disable it...
(If ECN is the problem and if the suffering firewalls/gateways are in you=
r
control, the real solution would be to fix the firewalls/gateways.)


Gr,
Rob



