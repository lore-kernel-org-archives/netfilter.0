From: Greg Cope <gregcope@gmail.com>
Subject: Re: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 22:06:30 +0000
Message-ID: <c0e9781f0501251406a5097ec@mail.gmail.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019922@pxtvjoexd01.pxt.primeexalia.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019922@pxtvjoexd01.pxt.primeexalia.com>
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

Bingo.

Seemed to have solved it.  I noticed that without the firewall running
the following rule was in the stop section:

iptables -t nat -A POSTROUTING -s 192.168.0.0/24  -j MASQUERADE

Looking at the tcp dumps when it "worked" without the firewall the db
server thought it was talking to the firewall.

When the firewall was on the db server was failing to talk to the
webserver, and the conection packet got through, but there never
seemed to be an ack packet backout.

I am a bit confused, but it seems to work now - which is good until
tomorrow morning.

Thanks for your help.

Not sure what the right way to do it is.  I suppose the LAN should be
masqueraded to the DMZ hosts, as the DMZ hosts should not have
detailed knowledge of the LAN side.

Greg
On Tue, 25 Jan 2005 12:00:43 -0800, Gary W. Smith <gary@primeexalia.com> wrote:
> Try something a little more generic and see if it helps.
> 
> Enable bi-direction for all hosts in DMZ and the LAN for all hosts...
> $IPTABLES -A FORWARD -p tcp --dport 1521 -i $DMZ_IFACE -o $LAN_IFACE -j
> ACCEPT
> 
> ### Notice --sport
> $IPTABLES -A FORWARD -p tcp --sport 1521 -o $DMZ_IFACE -i $LAN_IFACE -j
> ACCEPT
> 
> When the connection is started in the DMZ to the LAN the --dport will be
> 1521 but when the server is responding it should be doing so from 1521
> which no becomes --sport.  Or, at least, that's how I have interpreted
> it.
> 
> Once you get this working then modifiy the first rule to be point to
> point.  Test and if successful work on the return.
> 
> That's the only think that I can think of
> 
> Gary Wayne Smith
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
> 
> Sent: Tuesday, January 25, 2005 11:08 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Help debugging iptables firewall....
> 
> Its already configured like that :-(
> 
> When I drop all the ip rules I can connect.
> 
> Greg
> 
> On Tue, 25 Jan 2005 10:31:24 -0800, Gary W. Smith <gary@primeexalia.com>
> wrote:
> > My Oracle guy said that you need to open up either the high ports
> > (1024+) for communication or set Oracle to use a shared port.  He
> > mentioned that it works kind of like FTP in that the client
> established
> > a connection and then the server will open another reserve port back
> to
> > the client for the continued connection.  He said setting the
> share_port
> > setting (which he didn't know of the top of his head -- damn him)
> should
> > solve the problem.
> >
> > Hope that helps.
> >
> > Gary
> >
> >
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
> >
> > Sent: Tuesday, January 25, 2005 10:18 AM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: Help debugging iptables firewall....
> >
> > Removing my original rule I get logged:
> >
> > Jan 25 18:13:19 gateway kernel: Oracle 1521 [tcp] before: IN=eth1
> > OUT=eth2 SRC=192.168.254.3 DST=192.168.0.5 LEN=60 TOS=0x00 PREC=0x00
> > TTL=63 ID=29681 DF PROTO=TCP SPT=32941 DPT=1521 WINDOW=5840 RES=0x00
> > SYN URGP=0
> >
> > Jan 25 18:13:19 gateway kernel: Oracle 1521 [tcp] after: IN=eth1
> > OUT=eth2 SRC=192.168.254.3 DST=192.168.0.5 LEN=60 TOS=0x00 PREC=0x00
> > TTL=63 ID=29681 DF PROTO=TCP SPT=32941 DPT=1521 WINDOW=5840 RES=0x00
> > SYN URGP=0
> > Jan 25 18:13:19 gateway kernel: FORWARD DENY: IN=eth1 OUT=eth2
> > SRC=192.168.254.3 DST=192.168.0.5 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > ID=29681 DF PROTO=TCP SPT=32941 DPT=1521 WINDOW=5840 RES=0x00 SYN
> > URGP=0
> >
> > Greg
> >
> > On Tue, 25 Jan 2005 10:09:43 -0800, Gary W. Smith
> <gary@primeexalia.com>
> > wrote:
> > > Crap, I had a typo.  It should have been -i, not -o for the lan
> > > interface
> > >
> > > $IPTABLES -A FORWARD -o $DMZ_IFACE -i $LAN_IFACE -j ACCEPT
> > >
> > > Try that and let us know.
> > >
> > > Gary Wayne Smith
> > >
> > >
> > > -----Original Message-----
> > > From: netfilter-bounces@lists.netfilter.org
> > > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg
> Cope
> > > Sent: Tuesday, January 25, 2005 9:59 AM
> > > To: netfilter@lists.netfilter.org
> > > Subject: Re: Help debugging iptables firewall....
> > >
> > > I think we are getting there:
> > >
> > > The one you suggested gives an error:
> > >
> > > Starting firewall: ^[[Aiptables v1.2.9: multiple -o flags not
> allowed
> > >
> > > Looking at tcpdump on a few machines it looks like the packets are
> > > getting through - but nothing gets sent:
> > >
> > > 17:57:18.168655 ex.e-dba.net.32931 > trotter.e-dba.net.1521: S
> > > 965495617:965495617(0) win 5840 <mss 1460,sackOK,timestamp 2026024
> > > 0,nop,wscale 0> (DF) [tos 0x10]
> > >
> > > And then nothing else - sadly I am not a tcpdump expert.....
> > >
> > > Any clues?  I am at a loss as to why this was working and now it
> does
> > > not.....
> > >
> > > Greg
> > >
> > >
> >
> >
> 
>

