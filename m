From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: ipt_string
Date: Mon, 20 Sep 2004 14:43:46 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E373@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Linux Query <linux_query@yahoo.com>, netfilter@lists.netfilter.org

Linux Query wrote:
> Daniel Chemko <dchemko@smgtec.com> wrote:
>=20
>> Or even better, use Snort-inline to detect infiltrations and use its
>> built-in response engine to drop the packets.
>=20
> Didn't know about snort. Does it support string matching ?
>=20
Snrot's generally used for Intrusion detections, but it is basically one
big string matching program a lot like l7filter that you mentioned in an
earlier post. I couldn't say which one is better suited for your needs.

Snort-inline does take some hand-holding to get started, but I believe
that more intrusions will be caught through snort than you adding rules
adhoc to l7filter.=20

