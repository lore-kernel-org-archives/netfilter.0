From: "IT Clown" <iptables@mailbox.co.za>
Subject: Re: client on local network
Date: Sun, 28 Mar 2004 12:49:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-269324379@mail01.infosat.net>
References: <200403280948.45991.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403280948.45991.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Hi

I have just finished reading netfilter howto and im just
over halfway with Oskar Andreasson's tutorial.Here is my
rule again does this look correct?
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A INPUT -i eth0 -s 192.168.0.1 -p tcp -d 192.168.0.11 -m
multiport --sport 80,8080 -j ACCEPT
-A INPUT -i eth0 -s 192.168.0.1 -p tcp -d 192.168.0.11
--sport 53 -j ACCEPT
-A OUTPUT -o eth0 -d 192.168.0.1 -p tcp -s 192.168.0.11 -m
multiport --dport 80,8080 -j ACCEPT
-A OUTPUT -o eth0 -d 192.168.0.1 -p udp -s 192.168.0.11
--dport 53 -j ACCEPT
COMMIT

192.168.0.1 is my firewall and proxy.

Regards

On Sun, 28 Mar 2004 09:48:45 +0100
 Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Sunday 28 March 2004 9:31 am, IT Clown wrote:
> 
> > Hi
> >
> > i have setup a local network users iptables as follow
> to
> > access webpages:
> >
> > :INPUT DROP [0:0]
> >
> > -A INPUT -i eth0 -p tcp -m multiport --sport 80,8080 -j
> ACCEPT
> 
> Let's just look at the above two rules I have extracted
> from your ruleset.
> 
> The first says "default policy is to drop all incoming
> packets" (good idea).
> 
> The second says "accept all TCP packets coming in through
> eth0 from any 
> address to any service providing the source port is 80 or
> 8080" (not such a 
> good idea).
> 
> This will allow anything to connect to anything it can
> find (or run a port 
> scan etc) so long as the remote system uses source port
> 80 or 8080.
> 
> > I would like to know the way i set it up is it correct
> or is there a better
> > way.The client can browse.
> 
> I really would recommend you do what was suggested to you
> on Friday by David 
> Cannings:
> 
> > There are three things I would suggest.  The first is
> reading two
> > tutorials on
> http://www.netfilter.org/documentation/index.html -
> > specifically the "packet filtering HOWTO" and the "NAT
> HOWTO".
> >
> > The second is Oskar's excellent iptables tutorial, at
> >
>
http://iptables-tutorial.frozentux.net/iptables-tutorial.html.
> >
> > The third is taking a while to work out what ports the
> services you
> > mention work on.  A basic feel for how TCP/IP
> connections work would help
> > too.  The knowledge that in most cases a client chooses
> a port >1024 and
> > connects to the service port should suffice.  People on
> the list could
> > easily list the ports you need to allow or deny but
> you'll learn a
> > tremendous amount by spending 10 minutes working it
> out.
> 
> Regards,
> 
> Antony.
> 
> -- 
> The first fifty percent of an engineering project takes
> ninety percent of the 
> time, and the remaining fifty percent takes another
> ninety percent of the 
> time.
> 
>
                                                     Please
> reply to the list;
>
                                                          
> please don't CC me.
> 
> 

__________________________________________________________________________
http://www.webmail.co.za/dialup Webmail ISP - Cool Connection, Cool Price

