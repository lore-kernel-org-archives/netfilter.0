From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 20:06:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c3d6e3$cdf03e60$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste> <20040109194247.GD24304@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

> > for marking i use:
> > "iptables -t mangle -A PREROUTING -i eth4 -s 192.168.0.22 -d
141.24.12.2 -j
> > MARK --mark-with 1"
> >
> > for selecting a routing table upon that marking i use:
> > "ip rule add fwmark 1 table test"
> >
> OK. Are these two instructions the only instructions active on the box?


besides of the marking there is a masquerading active, as mentioned in
previous mails:
"iptables -t nat -A POSTROUTING -o ppp4 -j MASQUERADE"

filter table is empty.

there exist other routing rules, but they are all rules from other hosts out
into the world. no rules backward, for internet-lan-direction i use the main
table.


> Both:
> "ip rule add fwmark 1 table test"
> and
> "ip rule add from 192.168.0.22 table test"
>
> are being used for the ping packets and seem to be equivalent. Your
problem
> seems to be the loss of the pong packets, right?

right

> >  tcpdump verifies, that indeed replies are coming in and shows, that no
icmp
> > error messages are sent out, what should be the case if no route back
could
> > be found due to incorrect routing.
>
> This part is not completely correct. The ICMP messages would go out
through
> ppp0, right? and you're not capturing that.
>
> Do a simultanious tcpdump on all the ppp interfaces and let us know the
result.

ok, i did monitor all interfaces using
"tcpdump -n -i ppp0 icmp and host 141.24.12.2"
and so on. as expected nowhere a pong went out. i think any pong leaving the
box would have showed up in the FORWARD counting rule in the first test.

> Although, with the output of "ip rule" it looks to me that table main must
be
> taken for the return traffic and you have a route to 192.168.0.0/24 there.

you are right. and _all_ routing tables contain a route to the local net, so
a packet should always find its way from the outside in. i think even if the
masquerading would be broken, the packet wouldnt get lost. it would show up
somewhere OR an icmp error would be sent to its sender. so is there a bug in
the routing code? and why am i then the only one having this problem?



