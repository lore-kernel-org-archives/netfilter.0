From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
Subject: Re: Iptables 'hang'
Date: 23 Dec 2002 14:32:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040650376.3963.9.camel@nxitmirms1>
References: <Pine.SOL.4.43.0212231549530.4381-100000@selene.nat.vu.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.43.0212231549530.4381-100000@selene.nat.vu.nl>
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
To: David Fokkema <fokkema@nat.vu.nl>
Cc: netfilter@lists.netfilter.org

Hi David,
the nis service as nfs are service based on rpc calls. Without going
into details this services cannot be accessed directly but there is a
"supervisor" called portmapper wich client asks something like:
"at which port is nis listening?" and it asks with the assigned local
nis port. 
iptables starting up dose some direct lookups to lookup itself for
example as 127.0.0.1 or interface addresses. iptables to do this uses
resolver libraries wich are used from many network client application
for example "ping" and this lookup are determined by nsswitch.conf.
Normally inside this file you should got something like:
hosts:          files dns
This states that when looking up host names you should first check files
(in this case /etc/hosts) and then check dns (in this case
/etc/resolv.conf). You should also have something like:
hosts:          files dns nis
or
hosts:          nis files dns
in this case nis is looked up first using udp protocol, and as stated
before using nis directly you must ask portmapper (111 udp port).
So why you got delay?
Because of your rules nis was timing out and iptables was waiting for
nis or dns timeout. This could also happen if you have something like:
hosts:          files dns
and the dns for any reason is not reachable and your files (/etc/hosts)
does not contain a correct mapping between name and ip address.
Hope to have answered your questions, if you still need more just ask!
bye

Marcello

Il lun, 2002-12-23 alle 15:51, David Fokkema ha scritto:
> Hoi Marcello,
> 
> It works! I'm going to figure out, why exactly, but I copied my
> nsswitch.conf from my 'good' partition to my 'bad' partition, and all
> hangs vanished immediately. Could you please tell me what iptables wants
> with port 111 (portmapper)?
> Thanks for the help!
> 
> David
> 
> 
> On 23 Dec 2002, Marcello Scacchetti wrote:
> 
> > Date: 23 Dec 2002 13:57:37 +0100
> > From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
> > To: David Fokkema <fokkema@nat.vu.nl>
> > Subject: Re: Iptables 'hang'
> >
> > Hi,
> > could be a dns resolve problem... it can look up at 111 if nis is listed
> > as a resolution method. Try to do an iptables -nL, -n disable lookup.
> > Check nsswitch.conf also to see what is going on there.
> >
> > Marcello
> >
> > Il lun, 2002-12-23 alle 13:21, David Fokkema ha scritto:
> > > Hi there!
> > >
> > > I have a problem, and I think it is the same as one posted earlier, but
> > > the solution given is not correct. I run kernel 2.4.20, iptables 1.2.7a. I
> > > have this, as a test:
> > >
> > > iptables -P INPUT DROP
> > > iptables -A INPUT -p tcp -j ACCEPT
> > >
> > > And this will hang my system for about 1 minute. In that time, I noticed
> > > (with the use of tcpdump) that iptables tries to connect to port 111 on my
> > > box using udp. Why? Anyway, because the policy is DROP, it won't connect,
> > > and an ICMP message is not sent back. If I take a policy of ACCEPT, ICMP
> > > messages will be sent and iptables behaves fine. When I want to list my
> > > rules using iptables -L, it again hangs for some time (trying to connect
> > > to 111) and finally gives the list. The rule mentioned above is added, it
> > > only took some time. If I do iptables -nL (notice the 'n') it all works
> > > fine. Why is this? It is very annoying, particulary since another linux
> > > partition on my box doesn't have this problem. If I chroot to that
> > > partition, so using the same kernel version, iptables does not hang. Same
> > > version of iptables, same version of libc. What is going on here? Am I
> > > missing a configuration file somewhere? What does iptables want with udp
> > > port 111? If someone can clear this up for me, I'd be very happy to hear
> > > about it.
> > >
> > > Regards,
> > >
> > > David
> > --
> > Marcello Scacchetti <marcello.scacchetti@nextrem.it>
> >
-- 
Marcello Scacchetti <marcello.scacchetti@nextrem.it>

