From: "hare ram" <hareram@sol.net.in>
Subject: Re: [LARTC] Performanace fo the Iptables Server
Date: Wed, 27 Aug 2003 22:33:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011601c36cbd$185a5da0$c2bf09ca__8931.60624332285$1062044216@Housecall>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall> <200308271730.07228.stef.coene@docum.org>
Reply-To: "hare ram" <hareram@sol.net.in>
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
To: Stef Coene <stef.coene@docum.org>, netfilter@lists.samba.org
Cc: lartc@mailman.ds9a.nl

Hi Stef

thanks for the reply

yes i would like to do accounting the source IP
so i need to log them all the traffic,
so i will know each IP how much transfering DATA

with my configuration, is there any performance issue
i may have more than thousands of passing through this firewall or qos
server

so my PC will have any performance issue or,
this configuration need any modification

thanks
hare
----- Original Message -----
From: "Stef Coene" <stef.coene@docum.org>
To: "hare ram" <hareram@sol.net.in>; <netfilter@lists.samba.org>
Cc: <lartc@mailman.ds9a.nl>
Sent: Wednesday, August 27, 2003 9:00 PM
Subject: Re: [LARTC] Performanace fo the Iptables Server


> On Wednesday 27 August 2003 07:46, hare ram wrote:
> > Hi all
> >
> > I have RH 9.0
> > PIII with 550Mhz
> > 512MB RAM
> >
> > working fine with Iptables+TC+HTB
> >
> > Now i want o make accounting system using ULOG
> >
> > so i introduced  to send all logs to Mysql
> > So i can make my own Graphs
> >
> > iptables -A INPUT -j ULOG
> > iptables -A FORWARD -j ULOG
> > iptables -A OUTPUT -j ULOG
> >
> >
> > the Server is connected to Several Clients
> >
> > does this server will have any Impact of performance
> > or this PC can handle Easily
> >
> > how can caluculate the PC configuration,
> The needed configutation also depends on how many logs you will have and
how
> you are going to proces them.
> And do you really want to log everything?  If you are interested in what's
> going thru your firewall, you can also log the connections.  Or you can
> install ntop on the firewall.
>
> Stef
>
> --
>
> stef.coene@docum.org
>  "Using Linux as bandwidth manager"
>      http://www.docum.org/
>      #lartc @ irc.oftc.net
>
>


