From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 10:36:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62E807@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Ruprecht Helms <rhelms@mayn.de>, Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

The default UNIX traceroute uses UDP sockets, port > 30,000+.

ICMP would not help him here, unless he is using (mtr) which uses ICMP.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ruprecht Helms
Sent: Wednesday, June 30, 2004 10:04 AM
To: Peter Marshall
Cc: netfilter
Subject: Re: traceroute

Peter Marshall wrote:

>Hi.  I was wondering what I would need for rules to have traceroute
work
>through my firewall.  (I have a box behind the firewall trying to get
out
>using traceroute).
>
>Have a look to the icmp-types. You can begin by enabling icmp
generally.
> =20
>
Regards,
Ruprecht




