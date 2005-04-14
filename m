From: `VL <vl.homutov@gmail.com>
Subject: Re: feature request
Date: Thu, 14 Apr 2005 20:50:51 +0400
Message-ID: <aec22fc50504140950949956c@mail.gmail.com>
Reply-To: `VL <vl.homutov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Apr 8, 2005 4:00 PM, Timothy Earl <mehimx@gmail.com> wrote:
> Hi,
>
> I think to solve your problem you could work around it by using a series =
of
> awk grep and sed commands along with iptables -vL to test if your rule is
> loaded, presently that is how i get my current ip etc..
>
> man awk, man grep, man sed
>
> for example:
>
> EXTIP=3D"`/sbin/ifconfig ppp0 | grep 'inet adr' | awk '{print $2}' | sed =
-e
> 's/.*$
>
> Regards,
>
> Tim

I do know that i can work around my problem with thousands of ways =3D)
. I was surprised that it is impossible with iptables just to test if
rule was loaded, i was sure option existed. One more question i have:
what is the reason to add rules, that already exists in chain more and
more? Why not return failure and say "rule already loaded?" It`s not a
critic, i just want to understand why i can need more than 1 same rule
for 1 chain.

Second, grepping & awking around output of iptables with certain
options doesn`t seem 'reliable' to me. I have to compare string like:

OUTPUT -o eth0 -p tcp -s 192.168.127.29 -d 192.168.127.30 -j ACCEPT
to:
0     0 ACCEPT     tcp  --  *      eth0    192.168.127.29
192.168.127.30

Not impossible, but not very pleasant. The more complex rule i will
have, the more pain. Additional parameters, for example mac addresses,
tcp flags - what will happen to my rule matching, based on shell, if i
add couple of new options to my rule?

So, i`d prefer to write something simular to init scripts, when i have
to remember state of each loaded rule: is it loaded or not. But here
there are other problems: what if i manually add/delete rule? this
should not happen if i have 'my super system', but it`s life... so
again i have to reinvent wheel.

And all of this can be solved by simple( well,i think so =3D))
modification. We can add -test option or we can return false while
trying to load rule, that already exists in the chain.

