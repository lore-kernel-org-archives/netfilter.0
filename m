From: Brent Gregersen <gregerse@chemsun.chem.umn.edu>
Subject: RE: work ip address at home
Date: Wed, 22 Oct 2003 22:20:25 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031022220332.U2796@chemsun.chem.umn.edu>
References: <7C9884991ADAE0479C14F10C858BCDF5122E78@alderaan.smgtec.com>
 <20031022125857.K34090@chemsun.chem.umn.edu> <Pine.LNX.4.53.0310221918430.4648@xena.cft.ca.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0310221918430.4648@xena.cft.ca.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Carter <jimc@math.ucla.edu>
Cc: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

> If it's anything like flexlm, there's a license file on the local machine
> which tells it the host name and port number of the server.  Flexlm
> actually doesn't care which of our various subnets the client is on, only
> how many licenses it's passed out, though our firewall rules DO care :-)
> In any case, it would be worth the effort to try to fake it out using ssh.
> Here's a sample command line for forwarding SMTP (port 25) that I (used to)
> use for sending mail as if local, to bypass our anti-relaying rules (look
> at the headers of this message, for the current solution :-)
>
> /usr/bin/ssh -q -x -f -N -L 20025:julia.math.ucla.edu:25 julia.math.ucla.edu
>
> (-q - quiet, -x = omit X-windows, -f = drop into background, -N = omit
> shell command, -L = port forwarding.)  I test by doing...
>
> telnet localhost 20025
>
> To my HELO, it responds:
>
> 250 julia.math.ucla.edu Hello julia.math.ucla.edu [128.97.4.254], pleased
> to meet you
>
> The packets appear to come from Julia, the host listed in the -L parameter.
> It might be a good idea to turn on keepalives, so a forgotten connection
> automatically exits when the net connection goes down.
> >

Yes, like flexlm there is an enviroment variable TLMHOST that is set to
the name of the license server.

I had actually just tried the ssh tunnel, only to find out the the license
request goes out over udp, and dosent get forwarded.

I now however have pptp(d) set up on my home and work machines.
Communication between home and work over point-to-point link is verified
and I added a route on the home machine 'route add -host $TLMHOST ppp0' so
that requests to the license server will be carried over the ptp
connection.

however, when I ping $TLMHOST, the packets are getting swallowed by my
machine at work. (ifconfig at work shows arriving packets on ppp0 and the
pptp-php-gtk.php status window at home shows outgoing packets on ptp
connection.)

Im sure I just dont have the firewall/routing rules configured on my work
machine to properly route the ppp0 connection (to/from home) onto eth0 (public ip
subnet at work). Im fairly certain that if the routing/forwarding/nat is
set up correctly, I could obtain a key over the point-to-point link.

Any suggestions on a 'proper' iptables configuration to do the above?
(pass ppp0 packets from home onto eth0 at work so that replies will come
back through ppp0 to my home machine)


Thanks again for all the suggestions...

