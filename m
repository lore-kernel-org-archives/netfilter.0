From: JM <jerome@gmanmi.tv>
Subject: Re: iptables help..
Date: Mon, 13 Oct 2003 11:12:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310131112.04067.jerome@gmanmi.tv>
References: <200310101245.55993.jerome@gmanmi.tv> <1065763796.1650.21.camel@kermit>
Reply-To: jerome@gmanmi.tv
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065763796.1650.21.camel@kermit>
Content-Disposition: inline
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

hi,

i added LOGging on server_A

log all INPUT and FORWARD to messages log file... and for some reason nothing 
is comming up...

[ having nightmares on this.. : (  ]

TIA

On Friday 10 October 2003 13:29, Ralf Spenneberg wrote:
> Am Fre, 2003-10-10 um 06.45 schrieb JM:
> > i want to access the http server on "remote server x" from LAN.. without
> > going through the internet.. so what i did is setup DNAT on "remote
> > server A" but somehow its not working..
> >
> > this is my ruleset..
> >
> > NAT
> > -A PREROUTING -d serverA_IP -p tcp -m tcp --sport 1024:65535 --dport 81
> > -j DNAT --to-destination serverx_IP:80
> >
> > FILTER
> > -A INPUT -p tcp -s LAN_IP/24 --sport 1024:65535 -d serverA_IP --dport 81
> > -j LOG --log-prefix "INPUT packets:" -A FORWARD -d  serverx_IP -p tcp -m
> > tcp --sport 1024:65535 --dport 80 -m state --state NEW -j ACCEPT -A
> > FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -p tcp -j LOG --log-prefix "FORWARD packets:"
>
> So how does it not work? What error messages do you see? Did you enable
> routing on server_A? You probably want an SNAT rule too, because
> otherwise server_X will try to answer directly to the LAN. That might
> create problems doing conntrack on server_A and your Firewall protecting
> the LAN.
>
> Cheers,
>
> Ralf


