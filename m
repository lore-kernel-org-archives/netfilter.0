From: Ben <bench@silentmedia.com>
Subject: Re: simple nat question
Date: Tue, 2 Jul 2002 13:37:48 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.30.0207021335410.7072-100000@gilgamesh.eos.SilentMedia.com>
References: <20020702195549.KWOG295.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020702195549.KWOG295.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NetFilter <netfilter@lists.samba.org>

Thanks for the quick responses! This worked perfectly... I hadn't realized
that DNAT would also handle the return path.

On Tue, 2 Jul 2002, Antony Stone wrote:

> On Tuesday 02 July 2002 8:34 pm, Ben wrote:
>
> > I've got a basic nat setup:
> >
> >   internet
> > +====+=====+ eth0: 1.2.3.4
> > | firewall |
> > +====+=====+ eth1: 10.0.0.1
> >
> > +====+=====+ eth0: 10.0.0.2
> > |  server  |
> > +==========+
> >
> > What I would like is for packets coming from the server (10.0.0.2) to get
> > SNAT'd to the firewall's IP address, 1.2.3.4. It seems easy enough to do:
> >
> > iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.2 -j SNAT --to 1.2.3.4
> >
> > But now I don't see how return packets are going to make it back to my
> > server, because the firewall is going to think they are destined for it.
>
> You forget that there is magic inside netfilter :-)
>
> Just use the above rule (along with the appropriate FORWARD rules for
> server-bound requests and internet-bound replies), and it will all work
> wonderfully :-)
>
> > If I add the rule:
> >
> > iptables -t nat -A PREROUTING -d 1.2.3.4 -i ! eth0 -j DNAT --to 10.0.0.2
> >
> > Then it seems I lose the ability for the firewall to run anything
> > accessable to the outside world, like ssh.
>
> Yes, you are correct, so do not add the above rule :-)
>
>
>
> Okay, for a more serious answer....
>
> You are thinking only about IP addresses, and forgetting about port numbers.
>
> The firewall can use the port numbers to identify which incoming packets from
> the Internet are responses to packets it previously translated from the
> server, and it will automatically translate these replies back to the server;
> however any other packets with port numbers which do not correspond to
> previously sent packets do not get automagically translated, and therefore
> terminate on the firewall (eg SSH).
>
> You never normally need to include the second rule you've written unless you
> really do want all packets for IP 1.2.3.4 to be sent on to 10.0.0.2 - in most
> cases you only want this to happen for a few special port numbers (eg TCP
> port 80 if the server is a web server, TCP port 25 is it's a mail server, UDP
> & TCP ports 53 if it's a DNS server, etc).
>
> Therefore I suggest you use something like the following rules (I am assuming
> for this example that the server is a web server running http and not https):
>
> iptables -A PREROUTING -t nat -d 1.2.3.4 -p tcp --dport 80 -i eth0 -j DNAT
> --to 10.0.0.2
> iptables -A FORWARD -p tcp--dport 80 -d 10.0.0.2 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A POSTROUTING -t nat -s 10.0.0.2 -o eth0 -j SNAT --to 1.2.3.4
>
> Then if you want to allow SSH to the firewall itself:
>
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
>
> (it would be good to add a -s a.b.c.d option to this if you can restrict the
> source address range you will be SSHing from)
>
>
>
> Antony.
>


