From: skydive <skydive@megamail.pt>
Subject: Re: http access - fixing DNAT port forwarding access from internal
 networks.
Date: Fri, 21 Nov 2003 11:05:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069412714.3fbdf16a0caeb@paris-hme1>
References: <1069364822.3fbd3656723b4@roma-hme1> <3FBD42BA.4000504@suse.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3FBD42BA.4000504@suse.net.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Damien Mason <damien@suse.net.au>
Cc: netfilter@lists.netfilter.org

Damien:

first of all i'm glad i was clear enough so somebody=20
could understand what my problem was!!
thank you for helping and i can say to you that it is=20
working just fine, and i guess i'll do the same to my=20
stmp server, so i can use absolute domain adresses,=20
instead of using a lan domain to access pop and stmp=20
server to send and receive mail ;))

thank very much for your time [][]


C=F3pia Damien Mason <damien@suse.net.au>:

you need an SNAT rule in there too.
>
> iptables -t nat -A POSTROUTING -p tcp --dport
> $PORT -s
> $INTNETWORK/SUBNET -d $INTIPSERVER -j SNAT
> --to-source $INTIPFIREWALL
>
> eg.
> iptables -t nat -A POSTROUTING -p tcp --dport
> 80 -s 192.168.0.0/24 -d
> 192.168.0.1 -j SNAT --to-source 192.168.0.254
> (assuming .254 is your firewall and .1 is your
> webserver)
>
>
> skydive wrote:
>
> >hi all
> >
> >i have been experienced a problem since i'm
> trying to
> >access my web server from my lan through my
> internet ip.
> >
> >i have no problems doing DNAT, from those who
> access my
> >web page form the outside:
> >
> >iptables -A PREROUTING -t nat -i eth0 -p tcp
> --dport 80
> >-j DNAT --to 192.168.0.1:80
> >
> >this is solving the problem
> >
> >let's say my web page has the following
> address
> >www.example.org, and that it is host  [like it
> is ;)) ]
> >in one machine on my lan with the following
> IP:
> >
> >192.168.0.1
> >
> >when i write www.example.org on my web
> browser, it just
> > hits eth1 on my gateway/firewall and stucks
> there.
> >maybe i'm missing something on my prerouting
> rules, or
> >maybe my small brain just can't reach it :)
> >
> >the way i see it, when i put www.example.org
> on my web
> >browser, i send i request to my gateway, and
> it was
> >supposed to take it back to my lan, where the
> site is
> >hosted.
> >
> >not working though...
> >
> >can somebody please help with these missing
> rules?! or
> >is it just something else i'm missing?
> >
> >thanks to those who took the time to ride all
> this
> >garbage and i'm greatfull even if you are not
> able to
> >help whatever your reason is ;)))
> >
> >[][] * * *
> >skydive!
> >
> >-------------------------------------------------
> >Email Enviado utilizando o servi=E7o MegaMail
> >
> >
> >
> >
>
> --
> Damien Mason
> SuSE Systems Specialist
>
> http://www.suse.net.au./
> damien@suse.net.au
>
> SuSE Linux Asia-Pacific Pty Ltd
> Ph: +61 (2) 943 943 94
> Fax:+61 (2) 9437 38 39
>
>
>
>=20



skydive!

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


