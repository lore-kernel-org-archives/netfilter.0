From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: what's the problem of DNAT,It seems there is a HIDE firewall
Date: Tue, 1 Nov 2005 12:23:43 +0800
Message-ID: <43a0cdcb0510312023p1bc472b4j@mail.gmail.com>
References: <43a0cdcb0510311737w7d55f872v@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510311737w7d55f872v@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Thank you for everyone, I've found the problem. The internet machine
that I used has his own firewall, It just allow 80 ports traffic.

2005/11/1, Buddy wu <ejournal4me@gmail.com>:
> Thank you, but I don't think so
>
> Now I found that It seems have a HIDE firewall, the firewall just only
> allow the access from internet at port 80, and will deny  access at
> all the other ports.
> And I can access to the internet address( the firewall's machine like
> 211.211.112.11) at any port that the firewall have a DNAT RULE, but i
> can't access it except port 80 from internet.
> It just like the firewall just allow the access at 80 from internet,
> but I don't set the firewall, It like it's burn with the machine. I
> promise I didn't set that firewall, and I have checked my rule that It
> doesn't drop other ports access
>
> 2005/10/31, Henrik Nordstrom <hno@marasystems.com>:
> > On Mon, 31 Oct 2005, Buddy wu wrote:
> >
> > > And there is another Interest thing (I'm pained with the "interesting=
 thing")
> > > where I use 'sbin/iptables -t nat -A PREROUTING -d Inet2 -p tcp
> > > --dport 8087 -j DNAT --to 192.168.16.100:8087' rule, I can access
> > > http://Inet2:8087 in the LAN, but I can't access http://Inet2:8087
> > > through Internet(I have a machine direct access to internet)
> >
> > Please verify the routing on 192.168.16.100. To me the data you have
> > indicates 192.168.16.100 does not have correct routing for the Internet=
.
> > From what I have seen the iptables rules is correct, but all your rules
> > with NAT to 192.168.16.100 is failing.
> >
> > Quite likely the NAT and firewall rules as such is working just fine, b=
ut
> > 192.168.16.100 does not know what to do with the return traffic.
> >
> > Regards
> > Henrik
> >
>

