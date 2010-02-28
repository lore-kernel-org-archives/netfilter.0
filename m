From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: sync flood and resource utilization .
Date: Sun, 28 Feb 2010 16:20:30 +0530
Message-ID: <20100228162030.2098a47f@infoservices.in>
References: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
	<4B8A3507.9020108@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8A3507.9020108@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 28 Feb 2010 10:19:03 +0100
Mart Frauenlob <mart.frauenlob@chello.at> wrote:

> On 27.02.2010 06:36, netfilter-owner@vger.kernel.org wrote:
> > iptables -A INPUT -j  DROP .
> > iptables -A OUTPUT -j ACCEPT
> > 
> > When i syn flooded my desktop . I can see all pkts are getting
> > rejected by the rule . But system becomes slow beacuse of this . Is
> > there any way to make system fast ? will black listing will help ?
> > 
> 

I use the following

[..........]

# Check hashlimit-htable-expire after 5 min ( 300000 mili second )

iptables -N syn-flood

iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
iptables -A syn-flood -p tcp --syn  -m hashlimit \
--hashlimit 200/sec --hashlimit-burst 3 --hashlimit-htable-expire
300000 \ --hashlimit-mode srcip --hashlimit-name testlimit -j RETURN

# Drop bad IP and put then in blacklist
iptables -A syn-flood -m recent --name blacklist --set -j DROP
iptables -A INPUT -j syn-flood

[.....]

This rule should come after all your incoming rules. This rule is also effective against apache benchmark attack and ping flood also.

regards

 

