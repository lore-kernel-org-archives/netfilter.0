From: netfilter@serverguy.net
Subject: Re: Subject: Problem with SNAT and same port number
Date: Mon, 23 Feb 2004 16:21:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402231621.22177.netfilter@serverguy.net>
References: <20040223052721.8508.52386.Mailman@netfilter-sponsored-by.noris.net> <40399938.AE4CE1DD@multitech.co.in>
Reply-To: netfilter@serverguy.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40399938.AE4CE1DD@multitech.co.in>
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
To: prabha <prabha@multitech.co.in>, netfilter@lists.netfilter.org

Hi,

Yes, I do include udp as well.  A tcpdump shows traffic two and from unti=
l I=20
insert that rule, then there is no return traffic sent, its as though its=
=20
being silently dropped, because nothing is in the logs either.  If I chan=
ge=20
the port to 52, the return traffic apears, but of course, on the wrong po=
rt.

> Hi
>
> >I am wanting to change the source address of outgoing packets that hav=
e a
> > src port of 53.
> > I have tried /sbin/iptables -A POSTROUTING -p tcp -t nat -o bond0 --s=
port
> > 53 -j SNAT --to-source 192.168.0.1:53
>
> If my understanding is correct, you want to do SNAT but without changin=
g
> the source port number. The above command should work.
> Can you check out if your DNS requests are on TCP or UDP? If they are o=
n
> UDP, you may need to extend the above rule for UDP also.
>
> Regards
> Prabha


