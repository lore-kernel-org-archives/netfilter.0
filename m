From: Mike D <mdm@optonline.net>
Subject: REMOVE FROM LIST
Date: Sat, 07 Sep 2002 08:14:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c25668$2ffb96c0$c7fea8c0@louie>
References: <200209071159.g87Bx5R02070@mail003.ownmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: ashivale@ownmail.com, Didier Hung Wan Luk <DidierH@frci.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

THIS SPAM



----- Original Message -----
From: <ashivale@ownmail.com>
To: "Didier Hung Wan Luk" <DidierH@frci.net>
Cc: "Netfilter Mailing List" <netfilter@lists.netfilter.org>
Sent: Saturday, September 07, 2002 7:59 AM
Subject: Re: Iptables rules...


> Hi,
> The default policy you set is the default for all the packets in that
chain. Hence you need not specify it again for the INPUT chain.
> bye,
> Amit
>
> Didier Hung Wan Luk wrote:
> > Hi All,
> >
> >
> > I am new to firewall/iptables can someone help me to clear up some
concepts about firewalling?
> >
> > If my default rule for the input chain of my external interface is DROP
need I again specify to DROP packets in the INPUT chain of my external
interface?
> >
> > i.e..
> >
> > #My Default rule
> > iptables -P INPUT DROP
> >
> > #Drop all attempts on my ext. interface trough port 6000:6063
> >
> > iptables -A INPUT -i ppp0 -p tcp --dport 6000:6063 -j DROP
> >
> > If I am right I think that I need not include a rule again saying to
drop packets to my 6000;6063 ports since I do not have a rule saying to
accept connections on these ports...
> >
> > Thanks,
> >
> > Didier Hung Wan Luk
> >
> >
>
>


