From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: Thu, 12 Dec 2002 09:25:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212120925.43434.netfilter@newkirk.us>
References: <5.1.0.14.2.20021212094109.02d83370@of23sm3>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20021212094109.02d83370@of23sm3>
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
To: Rasmus Reinholdt Nielsen <rasmus@narani.dk>, netfilter@lists.netfilter.org

On Thursday 12 December 2002 03:51 am, Rasmus Reinholdt Nielsen wrote:
> Hi
>
> I have the same problem here. Using kernel 2.4.19-pre9, where I just
> can't forward port 80. Port 8080 works for instace fine. I have also
> tried to redirect all requests on port 80 to port 8080, but without
> any luck. When connecting to port 80 the browser just hangs. I can see
> in the apache log on the webserver that it gets the request, so I
> think it is a problem of the packets not getting back through the
> firewall and to the browser.
>
> I just can't see what is wrong. I even tried the following rules to
> see it that would help, but it didn't
>
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -t nat -A POSTROUTING -j MASQUERADE
> iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j DNAT --to
> <http_ip>:80
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> This is not my usual firewall script, but I can't think of a more open
> one :)

Just a few observations.  I assume eth1 is your internet connection, so=20
you should probably be using:
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
Otherwise it will constantly be checking the IP of every interface and=20
masquerading packets outbound on every interface.
and you also need (did you just not list it?)
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
for the MASQ target to work.

> Anybody knows of this might be a problem with the 2.4.19 kernels, I
> have a 2.4.18 firewall as well on which forwarding IS working, with
> the same ruleset.

Is this just DNAT that fails, or all forwarding?  And just to be sure,=20
since you didn't say, are you testing it from outside the LAN, or from a=20
local machine (or the firewall box itself)?

j

