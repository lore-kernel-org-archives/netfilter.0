From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT error in access from lan
Date: Sun, 24 Nov 2002 19:12:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211241912.46778.netfilter@newkirk.us>
References: <H5Z6PE$Il5rET4TAiJJV6LeiS1fcjFV4uXas7y7I_X@uol.com.br>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <H5Z6PE$Il5rET4TAiJJV6LeiS1fcjFV4uXas7y7I_X@uol.com.br>
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
To: "americo.sb" <americo.sb@uol.com.br>, netfilter@lists.netfilter.org

On Friday 22 November 2002 06:32 am, americo.sb wrote:

> 1 - snat
> iptables -t nat -A POSTROUTING -o eth0 -p tcp -j SNAT --to-
> source 200.200.200.200
>  2 - dnat
> iptables -t nat -A PREROUTING -i eth0 -d 200.200.200.200 -p
> tcp -m tcp --dport 80 -j DNAT --to-destination 10.0.0.254:8080
>
>  the problem =EDs:
>  if i write www.work.com from my house OK  - go to my
> ns_server.work.com
> go ns1_server.my.work.com  (iptables server - Name Server)
> go http_server.work.com
>  if i write www.work.com from my lan, error, server not found.

Oscar's tutorial covers precisely this situation at=20
http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#DNATTARGET=
=20

The gist of it is that you should add an extra SNAT rule, something like
iptables -t nat -a POSTROUTING -d 10.0.0.254 -j SNAT --to 10.0.0.1

www.work.com will realize that the client is on the LAN, and the response=
s=20
will be routed directly to the client instead of through the firewall. =20
Problem is that the client is expecting this response from the firewall's=
=20
public IP, NOT the DNATted server...  The above SNAT will ensure that all=
=20
DNATted connections will return to the firewall from www.work.com, regard=
less=20
of whether or not they are to local IPs.

j


