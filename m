From: Andreas Pettersson <andreas@knoxville.se>
Subject: Re: After 14 hours of brainpain...
Date: Mon, 3 Jan 2005 09:34:26 +0100
Message-ID: <46D3EF59-5D62-11D9-B917-000A95B981B6@knoxville.se>
References: <E6A0AAEA-5D1F-11D9-83E1-000A95B981B6@knoxville.se>
	<1104716217.6477.7.camel@hubcap.ljm.dom>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104716217.6477.7.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

So it should look like something like this instead.. ?
What does the -I do? and why is the order so important (just curious 
and wants to learn).

-- CUT HERE --

iptables -t nat -A POSTROUTING -o eth1 -d ! $INET_IP -j SNAT --to 
$INET_IP

iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--clamp-mss-to-pmtu

## WWW Forwarding ...
iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 192.168.1.30 --dport 80 
-j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p tcp -d $INET_IP --dport 80 -j 
DNAT --to 192.168.1.30:80

-- CUT HERE --
2005-01-03 kl. 02.36 skrev Jason Opperisano:

> On Sun, 2005-01-02 at 19:39, Andreas Pettersson wrote:
>> ## WWW Forwarding ...
>> iptables -t nat -A PREROUTING -d $INET_IP -p tcp --dport 80 -j DNAT
>> --to-destination 192.168.1.30
>> iptables -A FORWARD -d $INET_IP -p tcp --syn --dport 80 -m state
>> --state NEW -j ACCEPT
>
> the DNAT happens PREROUTING; which is before FORWARD--therefore, the
> destination IP at this point is 192.168.1.30; not $INET_IP.
>
>> iptables -t nat -A POSTROUTING -s 192.168.1.30 -p tcp --sport 80 -j
>> SNAT --to-source $INET_IP
>
> this is unnecessary; as the reply packets part of the DNAT-ed 
> connection
> will automatically be SNAT-ed, as nat is stateful.
>
> however--you do not have a rule that allows replies from the web
> server--might i simply suggest:
>
>   iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> -j
>
> --
> "Well, I'm not calling you a liar, but... I can't think of a way to
>  finish that sentence."
> 	--The Simpsons
>
>
>
--------------------------
ICQ: 1667613
MSN: neopocketsurf@hotmail.com
AIM: knxandyneo
Mail: andreas@knoxville.se
Skype: front.242
Mobil: 0702 45 78 03
Tfn: 019 764 80 18


