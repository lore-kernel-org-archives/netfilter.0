From: "Matt Barclay" <mbarclay@openfbo.com>
Subject: Re: Rerouting remote users to VPN channel
Date: Tue, 25 Apr 2006 09:56:09 +0200
Message-ID: <ac931180604250056o78395d79tb793c857b312886c@mail.gmail.com>
References: <444D25BA.6040505@pu.t-com.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444D25BA.6040505@pu.t-com.hr>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: ivan.gustin@pu.t-com.hr
Cc: netfilter@lists.netfilter.org

Hi Ivan,

Yes, you need SNAT and DNAT rules.  Something like this ought to work
(note: this should be on your Internet Gateway's Firewall, otherwise
you have to forward port 80 traffic from the Gateway to your linux
server.  You are running linux on your internet gateway, right?  ;)

iptables -t mangle -A PREROUTING -d <yourPublicIP> -p tcp --dport 80
-j MARK --set-mark 80
iptables -t nat -A PREROUTING -m mark --mark 80  -j DNAT --to 192.168.30.9
iptables -A FORWARD -m mark --mark 80 -j ACCEPT
iptables -t nat -A POSTROUTING -m mark --mark 80 -j SNAT --to
<firewallPrivateIP>

assumes the internet gateway has a route to 192.168.30.9

If you have to run this on a different linux machine, replace
<yourPublicIP> with <firewallPrivateIP>

If this doesn't work or doesn't make sense, be sure to post a network
diagram in your email.

Good Luck,

Matt

On 4/24/06, Ivan Gustin <ivan.gustin@pu.t-com.hr> wrote:
> Hi,
>
> I have one specific routing situation that I still can't handle, so I am
> asking for some help.
>
> I have Linux server, one eth interface and 2 DSL links. One DSL is VPN
> link to another site's Web Intranet application. VPN link itself is
> realised via DSL line and CISCO router. Local users can work with that
> application. Another DSL is Internet gateway for local users, and
> incomming channel for accessing server from outside (there is Siemens
> DSL router).
>
> I want to provide that external remote users can connect to that server
> from Internet and use that Intranet application via another DSL and VPN
> channel.
>
> Route table:
> # route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use
> Iface
> 192.168.30.9     192.168.93.65    255.255.255.255 UGH   0      0
> 0 eth0
> 192.168.93.64    0.0.0.0         255.255.255.192 U     0      0        0
> eth0
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 l=
o
> 0.0.0.0         192.168.93.122   0.0.0.0         UG    0      0        0
> eth0
>
> ...93.64/26 is LAN,
> ...93.65 is VPN gateway to Intranet Web server on another site,
> ...93.122 is Internet gateway,
> ...30.9 is Intranet Web server with The Application on remote site.
>
> Local users can go to Internet and on Intranet app on remote site, and
> that works fine. I need rules that Internet users comming from public IP
> using http://mysite.dyndns.biz:myport through ...93.122 can go to
> http://192.168.30.9:80. I succesfully set forwarding on DSL router so
> incomming packets comes to server on port 'myport' (I can't
> reroute/rewrite packets on DSL router itself).
>
> I tried with one PREROUTING rule, but I can't rewrite both source and
> destination address, so obviusly I need two rules?
>
> Thank anyone for any help,
> GI
>
>

