From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Re: Problem with counting
Date: Sun, 6 Oct 2002 18:21:32 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210061816520.16254-100000@balthasar.nuitari.net>
References: <20021005082807.KQUS7631.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021005082807.KQUS7631.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, 5 Oct 2002, Antony Stone wrote:

> On Saturday 05 October 2002 11:12 am, Nuitari wrote:
> 
> > I'm trying to get the byte counters to work with my nat firewall.
> >
> > However, only a small fraction of all of the traffic is actualy counted.
> >
> > iptables -A FORWARD -o eth0 -d 10.0.0.2 -j ACCEPT
> > iptables -A FORWARD -i eth0 -d 10.0.0.2 -j ACCEPT
> >
> > to try to count both incoming and outgoing data for the 10.0.0.2 host.
> > However when I do
> >
> > iptables -L -n -v -x
> >
> > All I see is 0 transfer, which is quite impossible as I use that host to
> > transfer huge amounts of data.
> 
> Show us the rest of your rules.
> 
> Antony.
> 
> 

extip="`/sbin/ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | sed -e 
's/.*://'`"
iptables -F FORWARD
iptables -F INPUT
iptables -F OUTPUT

iptables -P FORWARD ACCEPT
iptables -t nat -F POSTROUTING
iptables -t nat -F PREROUTING

EXTERNAL_INTERFACE="eth0"
IPTABLES="/usr/sbin/iptables"
INTERNAL_HOSTS="10.0.0.2 10.0.0.3 10.0.0.4 10.0.0.5 10.0.0.6 10.0.0.7 
10.0.0.8 10.0.0.9 10.0.0.10 10.0.1.2"

for HOST in $INTERNAL_HOSTS; do

        $IPTABLES -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
        $IPTABLES -A OUTPUT -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
        $IPTABLES -A FORWARD -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
        $IPTABLES -A INPUT -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
done;

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

after that there is a bunch of rules following this pattern

iptables -A FORWARD -i eth0 -o tr0 -p tcp --dport 873 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A PREROUTING -t nat -p tcp -d $extip --dport 873 -j DNAT --to 
10.0.0.2:873

I also tried having the following rules in the above for loop:
$IPTABLES -N $HOST
$IPTABLES -t -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j $HOST
$IPTABLES -A $HOST -o $EXTERNAL_INTERFACE -d $HOST
$IPTABLES -A $HOST -i $EXTERNAL_INTERFACE -s $HOST

I have kernel version 2.4.19 and iptables v1.2.6a


