From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: l7-layer
Date: Tue, 23 May 2006 13:00:27 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C401276F@knowledge.wizdom.nu>
References: <20060523091223.31816.qmail@web8514.mail.in.yahoo.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C401276E@knowledge.wizdom.nu>
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
To: netfilter <netfilter@lists.netfilter.org>

The application information is filtered by the L7 module from the DATA =
part of the TCP/IP packet. For example, the filter sees a TCP packet, =
destined for port 1110. It then inspects the data in the packet and sees =
something like GET / HTTP1.1 / www.bla.bla <http://www.bla.bla/>     The =
module, then knows it is an HTTP packet on port 1110. Or it sees =
something like PORT xxxx,xxxx and then knows it is FTP on port 1110
=20
Now I'm not familiar with nfsim, but it seems, that to test this L7 =
module, you would need to manually create the data part of the packets, =
if that is at all possible. I don't think it can simulate that much.
=20
Therefor I would say, testing this with real-time traffic is easier, =
faster and more reliable.
=20
-Sietse

________________________________

From: veera kumar [mailto:veera_kumar2983@yahoo.co.in]
Sent: Tue 23-May-06 11:12
To: Sietse van Zanen
Cc: netfilter
Subject: RE: l7-layer



Hi zanen,
    Its good to see your reply.The Layer7-filter
feature works as a firewall and classifies packets
based on L7 information instead of port numbers(e.g
Suppose client use 1110 is a http port number).
You can find the L7 feature Documentation here.
http://l7-filter.sourceforge.net/

I dont need  generate traffic from real time(e.g ftp
ftp.some.where).I have to generate traffic fron nfsim
using the command gen_ip.

Thanks
veera
--- Sietse van Zanen <sietse@wizdom.nu> wrote:

> Hi Veera,
>=20
> I would say, that doing an ftp ftp.some.where would
> generate traffic based upon the ftp appliaction.
> All the L7 information is included in the TCP/UDP
> packet which you are inspecting with your module.
>=20
> Maybe you need to be a bit more specific about what
> you want to inspect/filter with your module and how.
>=20
> Sietse
>
> ________________________________
>
> From: netfilter-bounces@lists.netfilter.org on
> behalf of veera kumar
> Sent: Tue 23-May-06 9:30
> To: netfilter@lists.netfilter.org
> Subject: l7-layer
>
>
>
> Hi,
>   I have done a netfilter module Which is support to
> Layer 7.I can able to compile our module with nfsim
> and tested the other functionalities.I have to test
> the Layer7 feature with nfsim.How can i generate the
> traffic
> based on application (e.g.ftp,ssh) rather than port
> numbers.
>
> I really appreciate your inputs here.;)
>
> Thanks
> veera
>
> Send instant messages to your online friends
> http://in.messenger.yahoo.com <http://in.messenger.yahoo.com/>=20
> <http://in.messenger.yahoo.com/>
>
>
>
>


Send instant messages to your online friends =
http://in.messenger.yahoo.com <http://in.messenger.yahoo.com/>=20



