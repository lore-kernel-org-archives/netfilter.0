From: "Jorge Canas" <jcanas2000@hotmail.com>
Subject: Re: How to loop back internal traffic?
Date: Sat, 10 Feb 2007 15:48:13 -0500
Message-ID: <BAY101-F17E518D8A7EE43BD96442BD9930@phx.gbl>
References: <1171105666.4319.5.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1171105666.4319.5.camel@anduril.intranet.cartel-securite.net>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: blancher@cartel-securite.fr
Cc: netfilter@lists.netfilter.org

>From: Cedric Blancher <blancher@cartel-securite.fr>
>To: Jorge Canas <jcanas2000@hotmail.com>
>
>Le samedi 10 f=E9vrier 2007 =E0 03:45 -0500, Jorge Canas a =E9crit :
> > How do I configure the firewall rules on the gw so that the port=20
>forwarding
> > also occurs when my other local network machines try to go to the=20
>website
> > via the public domain name?
>
>You have to extend your SNAT rule so thoses machines egts NATed when
>trying to reach this webserver using its public IP, otherwise, you'll
>get a triangle situation where your webserver sends its SYN/ACK directly
>through the LAN with its private IP.
>
>Something like:
>
>	iptables -t nat -A POSTROUTING -s $LAN -d $WebServPrivIP \
>		-j SNAT --to-source $GWPrivIP
>
>
>BTW, it's a FAQ, but I agree it might be difficult to find relevant
>answers in the wild.

Thanks for the reply Cedric.  I tried the rule but it did not work.  I got =
a=20
connection refused message. This is the rule I added:

iptables -A POSTROUTING -s 192.168.123.0/24  -d 192.168.123.164 -j SNAT=20
--to-source 192.168.123.161 -t nat

My internal webserver is running at 192.168.123.164
The internal interface of the GW is 192.168.123.161

_________________________________________________________________
Don=92t miss your chance to WIN 10 hours of private jet travel from Microso=
ft=20
Office Live http://clk.atdmt.com/MRT/go/mcrssaub0540002499mrt/direct/01/


