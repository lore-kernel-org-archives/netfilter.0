From: Pandu Poluan <pandu@poluan.info>
Subject: Re: how to access port forwarded server through internet ?
Date: Tue, 15 Mar 2011 21:16:12 +0700
Message-ID: <AANLkTimgnD6vHCwN6CL4cpeKiKd91LEbC3nP_U8R2pPX@mail.gmail.com>
References: <20110315175928.4dbbe83c@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110315175928.4dbbe83c@debian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

My previous email was not sent to the list >_<

My answer is below.


On Tue, Mar 15, 2011 at 19:29, J. Bakshi <joydeep@infoservices.in> wrot=
e:
> Dear list,
>
> Here is a port forwarding issue. =C2=A0I have a linux router which ha=
ve two NIC; one facing WAN and the other facing LAN. IP forwarding is a=
ctive and this box is working as a gateway. This box has LAN IP 192.168=
=2E1.1
>
> There is another box (webserver) 192.168.1.2 within the internal netw=
ork and the router box has port forwarding to access the webserver.
>
> ```````````````````````````
> iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
> iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -j DN=
AT --to 192.168.1.2:8080
> iptables -A FORWARD -p tcp -m state --state NEW --dport 81 -i ${LAN_I=
=46ACE} -j ACCEPT
> ````````````````````````````
>
> So within LAN I can access the 192.168.1.2 web server through =C2=A01=
92.168.1.1:81 as port forwarding is there. But I can not access the sam=
e through internet. If I point at <domain-name>:81 throught internet ; =
the browser simply reports it can't connect to the service; though the =
other services running at that very server are quite accessible through=
 internet. Have I missed something in my firewall rule ? Could anyone g=
ive any clue please ?
>
> Thanks
> --

You need another iptables rules for the WAN_IFACE

iptables -A PREROUTING -t nat -i ${WAN_IFACE} -p tcp --dport 81 -j
DNAT --to 192.168.1.2:8080

You can combine this new rule with the old rule by dropping the -i
selector. I.e. :

iptables -A PREROUTING -t nat -p tcp --dport 81 -j DNAT --to 192.168.1.=
2:8080

Next, also add a proper FORWARD rule, since the FORWARD rule will be
processed after NAT takes place:

iptables -A FORWARD -d 192.168.1.2 -p tcp --dport 8080 -j ACCEPT

This rule allows forwarding to the webserver (192.168.1.2) port 8080,
no matter the incoming interface, be it WAN_IFACE or LAN_IFACE. No
need to match the state here.

=46inally, remember that since the packets do not actually end up in th=
e
firewall box, you don't need the -A INPUT rule there. It never gets
matched.

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
Google Talk:    pepoluan
Y! messenger: pepoluan
MSN / Live:      pepoluan@hotmail.com (do not send email here)
Skype:            pepoluan
More on me:  My LinkedIn Account  My Facebook Account
