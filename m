From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: l7-layer
Date: Tue, 23 May 2006 10:43:40 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C401276C@knowledge.wizdom.nu>
References: <20060523073025.44282.qmail@web8503.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: veera kumar <veera_kumar2983@yahoo.co.in>, netfilter@lists.netfilter.org

Hi Veera,
=20
I would say, that doing an ftp ftp.some.where would generate traffic =
based upon the ftp appliaction.
All the L7 information is included in the TCP/UDP packet which you are =
inspecting with your module.
=20
Maybe you need to be a bit more specific about what you want to =
inspect/filter with your module and how.
=20
Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of veera kumar
Sent: Tue 23-May-06 9:30
To: netfilter@lists.netfilter.org
Subject: l7-layer



Hi,
  I have done a netfilter module Which is support to
Layer 7.I can able to compile our module with nfsim
and tested the other functionalities.I have to test
the Layer7 feature with nfsim.How can i generate the
traffic
based on application (e.g.ftp,ssh) rather than port
numbers.

I really appreciate your inputs here.;)

Thanks
veera

Send instant messages to your online friends =
http://in.messenger.yahoo.com <http://in.messenger.yahoo.com/>=20




