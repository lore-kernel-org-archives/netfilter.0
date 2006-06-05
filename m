From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Transparent proxy setup with apache on the nat gateway
Date: Mon, 5 Jun 2006 10:40:24 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C73@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Nicolas Mailhot <nicolas.mailhot@laposte.net>, netfilter@lists.netfilter.org

I think the error is in your first two rules for the PREROUTING chain in
the NAT table:


#-A PREROUTING -p tcp -m multiport --dports
http,https,squid,svn,http-alt,webcache -j REDIRECT --to-port 8081
#-A PREROUTING -p tcp -m multiport --dports
http,https,squid,svn,http-alt,webcache -j DNAT --to 192.168.1.1:8081

All WEB traffic will only hit the first rule and never the second. So
the destination IP address doen't get changed. A packet for 1.2.3.4 on
port 80 will be redirected to 1.2.3.4 port 8081.

I think you should try something like this.
Have apache proxy listen on localhost (127.0.0.1) port 8081
Iptables -t NAT -A PREROUTING -p tcp -i eth0(internal nic) -m multiport
--dports http,https,squid,svn,http-alt,webcache -j REDIRECT --to
127.0.0.1:8081

-Sietse

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Nicolas
Mailhot
Sent: Sunday, June 04, 2006 10:10 PM
To: netfilter@lists.netfilter.org
Subject: Transparent proxy setup with apache on the nat gateway

Hi,

I'm currently setting up a small LAN. The target hosts will be windows
laptops, so all the smarts are in a single FC5 linux box connected to
cable internet.

So far I've managed to setup pretty much everything I needed (dns, dhcp,
nat, smtp, webmail, spam-filter...) but I'm stuck on the transparent
proxy stage. I've got the gateway apache configured as proxy on the
lan-facing IP, and it works when configured manually in the laptop
browsers, but I'm not getting any further. All the docs on the internet
seem to focus on the squid-on-another-box scenario, and I'm failing to
adapt them to my setup. Can anyone help me?

(a big plus would be to make apache transparent proxy for the gateway
itself, as it will double up as my own system)

I've attached my current iptables rules if it can help.

Regards,

--=20
Nicolas Mailhot

