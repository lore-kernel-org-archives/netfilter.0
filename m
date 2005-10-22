From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: LAN Port forwarding with a dynamic IP address
Date: Sat, 22 Oct 2005 12:02:02 +0300
Message-ID: <3063e50510220202y512ebe84m4a531097eda7fea0@mail.gmail.com>
References: <FAC4E024BF776842876169173CE2F013289E@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F013289E@mailbox.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

Do a SNAT on the LAN interface for packets that goes to the private ip of
webserver with source ip $LAN/$MASK. Something like:
 lan=3Deth1
ipl=3D192.168.0.1 <http://192.168.0.1>
web=3D192.168.0.10 <http://192.168.0.10>
net=3D192.168.0.0/24 <http://192.168.0.0/24>
 iptables -t nat -A POSTROUTING -o $lan -p tcp --dport 80 -d $web -s $net -=
j
SNAT --to $ipl
 And a router will send packets wherever routing table says. Only rp_filter
can drop some of them (not in your case).

 On 10/21/05, Derick Anderson <danderson@vikus.com> wrote:
>
>
>
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Zac Hansen
> > Sent: Friday, October 21, 2005 7:00 AM
> > To: netfilter@lists.netfilter.org
> > Subject: LAN Port forwarding with a dynamic IP address
> >
> > I have a single, dynamic IP address. I have multiple boxes
> > behind a linux router, one of which runs a web server on port
> > 80. I have set up rules (a PREROUTING and a FORWARD rule) to
> > let people outside my LAN deal see my web server. The problem
> > is that the boxes on my LAN can't see them.
> >
> > I really don't want to hardcode my external IP address into
> > any rules and I don't want to do any DNS work to make the LAN
> > boxes look up the actual server's LAN IP address directly.
> >
> > Can I get my LAN boxes to see my web site and not do the
> > things I don't want to do?
> >
> > Thanks.
> >
> > --Zac
>
> Your internal boxes will never see the website unless you add internal
> DNS, do something extremely complicated with scripts and routing and
> mangling of packets, or go with a three-legged setup. The reason for
> this is that without manipulation, a router will never send a packet
> *out* through the same interface it came *in* on.
>
> What you want is for your internal LAN boxes to send a packet destined
> to your dynamic external IP to your firewall's LAN interface and for
> your firewall to say, "Hey, that server is actually <internal IP>! Let's
> bounce this packet there!" after which it would mangle the destination
> IP to be the internal IP and send it back. Also, you have to convince
> the kernel's routing functions to take a packet which has nothing to do
> with that machine and send it on to your internal webserver for every
> request since your internal LAN boxes will always believe the web server
> is at the external IP.
>
> I'm sure it can be done, but internal DNS is much easier, believe me.
>
> Derick Anderson
>
>


--
Bla bla
