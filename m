From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: portforward of port 80 not working
Date: Sat, 1 Feb 2003 15:45:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302011545.31115.netfilter@newkirk.us>
References: <5.1.0.14.2.20030201201121.02dcdeb0@linda.kadnet.dom>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20030201201121.02dcdeb0@linda.kadnet.dom>
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

On Saturday 01 February 2003 02:23 pm, Rasmus Reinholdt Nielsen wrote:
> Hi
>
> I have a problem forwarding port 80. I can forward any ofter port,
> like 81 or 8080. I juse
> iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 80 -j DNAT
> --to 172.16.1.7:80
>
> to forward with, eth2 being my wan-interface and 172.16.1.7 my
> webserver. It doesn't work. I can see in my apache log fil on the
> webser that the request gets there, but nothing comes back.
>
> If I try iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport
> 8080 -j DNAT --to 172.16.1.7:80 and adds :8080 to my url, it works. I
> have - ofcourse - disabled the webserver on my firewall host. I had it
> fixed one time, but for other reasons I had to rerun my
> iptables-script and since then it hasen't worked, that is why I think
> that it is an iptabels problem, eventhough I can't see what should
> make this happen.
>
> I have tried numerous differrent scripts to get this to work, even
>
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -t nat -A POSTROUTING -j MASQUERADE
> iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 80 -j DNAT
> --to 172.16.1.7:80
>
> just to try it - and that too didn't work.
>
> I am running kernel 2.4.19-pre9 and iptabels 1.2.7 on a redhat 7.3
>
> Hope somebody have an idea, and thanks in advance.
>
> /Rasmus

If you are /really/ using 1.2.7, update it now.  1.2.7 is considered=20
"broken" by the Netfilter team, and is supposed to be replaced with=20
1.2.7a in all installations.

That said, and updated if necessary, try:

iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 -j   \
=09DNAT --to 172.16.1.7
iptables -t nat -A POSTROUTING -d 172.16.1.7 -j SNAT --t ?.?.?.?
iptables -A FORWARD -d 172.16.1.7 -j ACCEPT
iptables -A FORWARD -s 172.16.1.7 -j ACCEPT

These four should do it, provided another rule is not diverting or=20
blocking the traffic.  If Apache logs show it arriving, then that is not=20
likely to be the case.  The ?.?.?.? in the SNAT needs to be the static=20
IP of the interface the traffic between the firewall and the server will=20
flow through.  If it is a dynamic IP, then you would need the MASQUERADE=20
target as you tried above, but you must also have=20
"echo 1 > /proc/sys/net/ipv4/ip_dynaddr" to allow the MASQ target to=20
track the IP of the interface, otherwise the target won't work.

The two forward rules are just generalizations that allow ANY traffic to=20
and from the server.  In a 'real' situation you'd want to tighten this=20
up, probably with port 80 allowed to the server, and ESTABLISHED and=20
RELATED allowed each direction.

j


