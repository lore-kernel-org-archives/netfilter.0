From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Thu, 12 Dec 2002 09:51:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20021212094109.02d83370@of23sm3>
References: <96C102324EF9D411A49500306E06C8D1021AE462@eketsv02.cubis.de
 >
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <96C102324EF9D411A49500306E06C8D1021AE462@eketsv02.cubis.de
 >
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Reckhard, Tobias" <tobias.reckhard@secunet.com>, netfilter@lists.netfilter.org

Hi

I have the same problem here. Using kernel 2.4.19-pre9, where I just can't 
forward port 80. Port 8080 works for instace fine. I have also tried to 
redirect all requests on port 80 to port 8080, but without any luck. When 
connecting to port 80 the browser just hangs. I can see in the apache log 
on the webserver that it gets the request, so I think it is a problem of 
the packets not getting back through the firewall and to the browser.

I just can't see what is wrong. I even tried the following rules to see it 
that would help, but it didn't

iptables -A INPUT -j ACCEPT
iptables -A FORWARD -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j DNAT --to 
<http_ip>:80
echo 1 > /proc/sys/net/ipv4/ip_forward

This is not my usual firewall script, but I can't think of a more open one :)

Anybody knows of this might be a problem with the 2.4.19 kernels, I have a 
2.4.18 firewall as well on which forwarding IS working, with the same ruleset.

thanks

/Rasmus


At 09:09 12-12-2002 +0100, Reckhard, Tobias wrote:
>Following up to myself...
>
> > Then that's where our impression differs. I have thought up
> > to now that
> > INPUT is hit before PREROUTING before FORWARD before
> > POSTROUTING before
> > OUTPUT. And that a packet may stop being processed between
> > PREROUTING and
> > FORWARD as well as between POSTROUTING and OUTPUT.
> >
> > I may check the one NATing firewall I have running.. later.
>
>I just did check that machine and you're right, I was wrong. So INPUT and
>OUTPUT rules shouldn't be required in the case we're discussing.
>
>Cheers,
>Tobias


