From: "Daniel " <daniel@eskozoo.com>
Subject: Re: iptables drops _some_ valid packets
Date: Tue, 19 Sep 2006 14:16:33 -0300
Message-ID: <40fff57a0609191016n205de4v7a36c516645c96a8@mail.gmail.com>
References: <40fff57a0609190652n2dce5f49ie37ec04952d2d139@mail.gmail.com>
	<45101B44.5060000@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45101B44.5060000@plouf.fr.eu.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hello,
Setting /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 1
did not solve the issue.

Thanks

On 9/19/06, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Daniel a =E9crit :
> >
> > Im having problems with iptables dropping some packets that belong to
> > an established/valid connection.
>
> If the kernel is >=3D 2.6.9 or includes the patch "tcp-window-tracking"
> from the Netfilter patch-o-matic-ng, try to set the kernel parameter
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 1.
> See
> http://www.netfilter.org/projects/patch-o-matic/pom-submitted.html#pom-su=
bmitted-tcp-window-tracking
>
>

