From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: possibly annoing ...
Date: Fri, 28 Feb 2003 02:48:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302280248.43412.netfilter@newkirk.us>
References: <OFBFE62721.93AFC0AB-ON80256CDA.005ECFD9@start-global.com> <001301c2de8c$263cc620$c80da8c0@service.agress.ro>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c2de8c$263cc620$c80da8c0@service.agress.ro>
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
To: "PiSiC..." <pisic@service.agress.ro>, richardo@start-global.com
Cc: netfilter@lists.netfilter.org

On Thursday 27 February 2003 01:14 pm, PiSiC... wrote:
>  First of all thanks for help ...
>  but i'm kinda new with iptables and i want to show you the big
> picture :
>
>  - i heard something about static NAT and dynamic NAT (not source or
> destination NAT) and i'm not sure i fully understand what is the
> aplicability on my situation.

Static is a static IP, Dynamic with a Dynamic IP.  Source NAT is where=20
you change the source IP on an outbound packet so it appears to=20
originate at the firewall, instead of a private IP 'behind' it. =20
Destination NAT is where you change the destination of an (usually)=20
incoming packet to send it elsewhere, usually used to send traffic=20
coming to a public IP to a machine 'behind' the firewall with a private=20
IP address. For SNAT (Source NAT) netfilter offers two flavors - SNAT=20
uses a single static IP, and MASQUERADE checks the IP of the interface=20
to make sure it uses the correct IP in a Dynamic IP setup.

> the situation is this :
>
>  i have a radio link with only one staticaly allocated  IP
> (aaa.bbb.ccc.ddd) which is connected on my linux machine on eth1
> eth0 on the same machine is connected on LAN.
> I have up and running Webserver,SMTP,FTP and POP3.
> I want to run now 2 webservers one on external and one on
> internal(that is easy with binding on their interfaces).
> But i want also to allow access from the world to a third webserver
> which runs on 192.168.13.199:80 which will be accesibile on port 33333
> on my external ip.

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 33333 -d DNAT
--to 192.168.13.199:80

Along with FORWARD rules to allow port 80 traffic going to 192.168.13.199=
=20
and to allow return traffic.  Likely return traffic will already get=20
through if your iptables box is allowing internet access from machines=20
on the LAN right now, but this would do it if not:

iptables -A FORWARD -i eth1 -m state --state ESTABLISHED,RELATED -j=20
ACCEPT

The inbound would be allowed with:

iptables -A FORWARD -d 192.168.13.199 -p tcp --dport 80 -j ACCEPT

j


