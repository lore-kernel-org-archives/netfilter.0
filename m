From: "david" <david@suarapembaruan.co.id>
Subject: Re: block port 137
Date: Wed, 4 Aug 2004 10:00:30 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d601c479cf$352a91f0$858310ac@suarapembaruan.com>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <002401c4 7917$d0a6fd70$858310ac@suarapembaruan.com> <1091513004.4660.34.camel@dc.nucleussoftware.com> <200408030717.59289.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Dear Antony,
I agree with you, i must block all traffic and accept one-by-one rules that
i want, but the problem is i don't know how to do this ...., btw.. this in
my rules

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 202.46.146.161
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.164 --dport
110 -j DNAT --to 172.16.128.50
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.164 --dport 25 -j
DNAT --to 172.16.128.50
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.165 --dport 25 -j
DNAT --to 172.16.128.125
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.165 --dport
110 -j DNAT --to 172.16.128.125
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.166 --dport 80 -j
DNAT --to 172.16.131.6
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.167 --dport 21 -j
DNAT --to 172.16.128.79bie
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.168 --dport 21 -j
DNAT --to 172.16.131.29

iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP

I know this rules is very weak.... can you help me to make my firewall
strongger......

Thank's a lot

David Kandou
Newbie

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 03, 2004 1:17 PM
Subject: Re: block port 137


> On Tuesday 03 August 2004 7:04 am, Dhananjoy Chowdhury wrote:
>
> > try dropping packets both with dport 137 and also with sport 137.
>
> I disagree.
>
> Try ACCEPTing the packets you *want* to go through the firewall, and DROP
> everything else.
>
> Don't create individual rules to DROP the traffic you think you don't want
> (you will always forget something, or there will be a new problem next
week
> which requires a new rule, etc).
>
> Instead create individual rules to ACCEPT the traffic you need, and DROP
> anything which doesn't fit that description.
>
> Regards,
>
> Antony.
>
> > On Tue, 2004-08-03 at 10:37, david wrote:
> > > Dear all,
> > > How to block outgoing traffic over network that using port 137 udp,
> > > because my isp tell me that my network broadcast virus using port 137
> > > udp, i want to make all traffic (port 137) do go outside my network,
> > > so i plan to blocking that traffic from my gateway.
> > >
> > > I already try to do this rules, but not working :
> > > #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP
> > >
> > >
> > >
> > >
> > > Regards,
> > > David Kandou
>
> -- 
> If builders made buildings the way programmers write programs, then the
first
> woodpecker to come along would destroy civilisation.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


