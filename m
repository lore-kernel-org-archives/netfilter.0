From: Carlos Lopez <chlopezl@yahoo.com>
Subject: Re: dual homed problem.
Date: Wed, 19 Jun 2002 00:43:49 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020619074349.5962.qmail@web13905.mail.yahoo.com>
References: <20020617194241.GG22025@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020617194241.GG22025@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.samba.org

Hi,
going on with the problem,

--- Ramin Alidousti <ramin@cannon.eng.us.uu.net>
wrote:
> Can you elaborate as to what's not working?
> 
> 0) What does tcpdump/etherreal say on the internal
>    interface?

In the private interface (eth2) it seems to have no
data going from the firewall to the web server (which
is in the private network) and coming from outside.

In the external interface I receive the following
data:
I'm connected via modem from an isp called telemovil,
so the cache of telemovil.com are my requests to see
the webserver thrughout the firewall:

01:36:39.246676 < cacheflow2.telemovil.net.35583 >
di.uca.edu.sv.http: S 2891067883:2891067883(0) win
 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
11600827 0>
01:36:39.606676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 217 win 7880 (DF)
01:36:39.736676 < cacheflow2.telemovil.net.35583 >
di.uca.edu.sv.http: S 2891067883:2891067883(0) win
 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
11600829 0>
01:36:40.766676 < cacheflow2.telemovil.net.35583 >
di.uca.edu.sv.http: S 2891067883:2891067883(0) win
 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
11600831 0>
01:36:42.726676 < cacheflow2.telemovil.net.35583 >
di.uca.edu.sv.http: S 2891067883:2891067883(0) win
 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
11600835 0>
01:36:45.336676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 385 win 7712 (DF)
01:36:46.246676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 421 win 7676 (DF)
01:36:47.256676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 449 win 7648 (DF)
01:36:48.176676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 477 win 7620 (DF)
01:36:49.156676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 505 win 7592 (DF)
01:36:49.726676 < cacheflow2.telemovil.net.35583 >
di.uca.edu.sv.http: S 2891067883:2891067883(0) win
 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
11600849 0>
01:36:50.086676 < 200.41.54.40.3644 >
fefwi.uca.edu.sv.ssh: . 0:0(0) ack 533 win 7564 (DF)

 
> 1) Without the DNAT rule and with the alias, can you
>    ping that IP, from outside of course?
yes, I can ping but I suppose that the ping is
responded by the aliased ip in the external interface.

> 2) If yes, could it be that you're sending the reply
>    packets out through eth1 and the ISP does some
>    anti-spoofing stuff?

As I said I see no data going to the internal web
server (which is in the private network) so I think
the firewall isn't leting the packages pass.

thanks in advance,
Carlos.

 
> Ramin
> 
> On Mon, Jun 17, 2002 at 12:35:13PM -0700, Carlos
> Lopez wrote:
> 
> > Do i need the alias ip to make the DNAT?
> > Is ok what I'm doing? if so, why it doesn't work?
> > pls help.
> > 
> > Carlos Lopez
> > 
> > --- Carlos Lopez <chlopezl@yahoo.com> wrote:
> > > Hi all,
> > > I'm working on a dual homed configuration. I
> have a
> > > firewall that makes the routing.
> > > the configurations is as follows:
> > > 
> > > public-ip-eth0 --\
> > >                   FIREWALL ----> private-ip-eth2
> > > public-ip-eth1 --/
> > > 
> > > I want to be able to have access to a server
> with a
> > > private ip throughout a public ip and DNAT.
> > > I understand that DNAT has session management so
> I
> > > did
> > > as follows:
> > > 
> > > on the firewall I configured public ips as
> aliases
> > > ie:
> > > ifconfig eth1:0 200.62.53.226 netmask
> > > 255.255.255.240
> > > 
> > > then added in the firewall the following line:
> > > iptables -A PREROUTING -t nat -d 200.62.53.226
> -j
> > > DNAT --to 172.28.16.4
> > > 
> > > is there something wrong?
> > > Why it doesn't work?
> > > 
> > > thanks in advance,
> > > Carlos L?pez.


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

