From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: ipt_string
Date: Mon, 20 Sep 2004 12:44:46 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679509@alderaan.smgtec.com>
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
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>, netfilter@lists.netfilter.org


> You can try using ipt_string, but you will run into serious
>   limitations. ipt_string operates on single packet.  If the string
> you are trying to match is (for whatever reason) broken into multiple
> packet, ipt_string will not find it.  Also, ipt_string does not know
> anything about application level protocols (such as HTTP).  If it
> finds ".exe" anywhere in the packet's payload, it will match (whereas
> Squid will match only if it is part of URL, and you can specify that
> it must be at the end of the URL).
>=20
> If I were you, I'd stick with Squid to do application level filtering.

Or even better, use Snort-inline to detect infiltrations and use its
built-in response engine to drop the packets.

