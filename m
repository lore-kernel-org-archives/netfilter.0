From: "Erick Sanz" <esanz@minorplanetusa.com>
Subject: RE: Home web server using front firewall
Date: Wed, 17 Dec 2003 15:30:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HFEBJMKNPOCPPMGFHDMCAEJBCDAA.esanz@minorplanetusa.com>
References: <200312102340.14210.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312102340.14210.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter <netfilter@lists.netfilter.org>


Anthony,

This are the entries I had to add to make it work:

iptables -P INPUT   DROP
iptables -P OUTPUT  DROP
iptables -P FORWARD DROP

iptables -t nat -A PREROUTING -p tcp -d 172.16.1.33 --dport 80 \
	-j DNAT --to 10.10.1.240

iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE

iptables -A INPUT -i eth0 -p tcp -d 172.16.1.33 --dport 80 -m state \
	--state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i eth1 -p tcp -s 10.10.1.240 --sport 80 -m state \
	--state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth0 -p tcp -d 10.10.1.240 --dport 80 -m state \
	--state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth1 -p tcp -s 10.10.1.0/24 --source-port 80 \
	-j ACCEPT

iptables -A FORWARD -o eth1 -p tcp -s 10.10.1.240 --sport 80 -m state \
	--state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -o eth1 -j ACCEPT

I have read the FAQ on forwarding; however, I can still not understand
the 3 forwarding statements needed; one of them is for input on eth0
(172.16.1.33) to 10.10.1.240.  The other one is for data received from
eth1 (10.10.1.240); however, I don't understand the third forward (can't
be taken out as it won't work then)... I see the difference as -i to
-o ... Is there a newby explanation on why?

Also, I would like to "lock" my OUTPUT chain to avoid Netbios and other
protocols to go out... any recommendations?

Thank you VERY much for your time!

Best regards,
Erick Sanz


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
> Sent: Wednesday, December 10, 2003 5:40 PM
> To: Netfilter
> Subject: Re: Home web server using front firewall
>
>
> On Wednesday 10 December 2003 11:24 pm, Erick Sanz wrote:
>
> > All,
> >
> > I am trying to install a small web server at home in order
> > to display some family pictures and some other personal
> > topics (hobbies, interests ...)
> >
> > For this I need port forwarding and probably NAT to change
> > the outgoing IP address.
>
> If you do DNAT for incoming packets, you will get automatic SNAT on the
> outgoing reply packets - you do not need to set up your own rule
> to handle
> these.
>
> > I want the real server to be completely blocked for
> > any other port than http and https on the web server
> > (I am planning to accept requests only from the internal
> > network).
>
> Um, do you really mean what that last bit says?   You only want to accept
> requests from the internal network - ie not from the Internet???
>
> > Am I forgetting anything else?
>
> The only thing I can see missing from the rules you posted is:
>
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> That rule will allow the reply packet to traverse your firewall,
> and return to
> the outside world (assuming that's what you really want to happen....).
>
> If you have any problems with the ruleset you posted (with the
> above addition)
> feel free to post here again, but please be as specific as you
> can about what
> the problem is, and how you have tested for it.
>
> Hope you have a good time with netfilter.
>
> Antony.
>
> --
> Success is a lousy teacher.  It seduces smart people into
> thinking they can't
> lose.
>
>  - William H Gates III
>
>                                                      Please reply
> to the list;
>                                                            please
> don't CC me.
>
>
>
>
> This email message has been scanned for viruses.
>
>



This email message has been scanned for viruses.



