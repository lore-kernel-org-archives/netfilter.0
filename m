From: Greg Cope <gregcope@gmail.com>
Subject: Re: Help debugging iptables firewall....
Date: Wed, 26 Jan 2005 07:19:26 +0000
Message-ID: <c0e9781f0501252319f7b6f27@mail.gmail.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019924@pxtvjoexd01.pxt.primeexalia.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019924@pxtvjoexd01.pxt.primeexalia.com>
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

Hiya,

[07:09:48 root@gateway root]$ cat /proc/sys/net/ipv4/ip_forward
1

It would seem that the one rule that is causing the issue is this one:

Works:

$IPTABLES -t nat -A POSTROUTING -s $LAN_IP_RANGE -j MASQUERADEb

Does not:

$IPTABLES -t nat -A POSTROUTING -s $LAN_IP_RANGE -d ! $LAN_IP_RANGE -j
MASQUERADE

The lan is on 192.168.0.0/24.
DMZ is on 192.168.254.0/24

Ie the -d ! $LAN_IP_RANGE

LAN_IP_RANGE="192.168.0.0/16"

So should the DMZ be natted to the LAN?  I would assume yes.

Are there any good guides to 3 inteface'ed firewalls - ie lan, dmz, red?

Greg

On Tue, 25 Jan 2005 14:11:30 -0800, Gary W. Smith <gary@primeexalia.com> wrote:
> Greg,
> 
> This might be real dump but do you have IP forwarding enabled?  If you
> do then NAT's isn't necessary between the LANs.
> 
> Gary
> 
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> > bounces@lists.netfilter.org] On Behalf Of Greg Cope
> > Sent: Tuesday, January 25, 2005 2:07 PM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: Help debugging iptables firewall....
> > 
> 
> > Bingo.
> >
> > Seemed to have solved it.  I noticed that without the firewall running
> > the following rule was in the stop section:
> >
> > iptables -t nat -A POSTROUTING -s 192.168.0.0/24  -j MASQUERADE
> >
> > Looking at the tcp dumps when it "worked" without the firewall the db
> > server thought it was talking to the firewall.
> >
> > When the firewall was on the db server was failing to talk to the
> > webserver, and the conection packet got through, but there never
> > seemed to be an ack packet backout.
> >
> > I am a bit confused, but it seems to work now - which is good until
> > tomorrow morning.
> >
> > Thanks for your help.
> >
> > Not sure what the right way to do it is.  I suppose the LAN should be
> > masqueraded to the DMZ hosts, as the DMZ hosts should not have
> > detailed knowledge of the LAN side.
> >
> > Greg
>

