From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 09:33:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62E7FF@email1.mitretek.org>
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
To: Peter Marshall <peter.marshall@caris.com>, netfilter <netfilter@lists.netfilter.org>

You need to set up the ESTABLISHED,RELATED rule.

Here is an example of a test firewall:
http://installkernel.tripod.com/ipls



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Peter Marshall
Sent: Wednesday, June 30, 2004 9:06 AM
To: netfilter
Subject: traceroute

Hi.  I was wondering what I would need for rules to have traceroute work
through my firewall.  (I have a box behind the firewall trying to get
out
using traceroute).

I have an allow established connections on my forwared chain, and I am
allowing anything from the source IP of the box in question to leave ...
It
appears that the problem is on the packets comming back in .. but I am
not
sure what I have to do to fix it ....

Thanks

Peter



