From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables forwarding
Date: Thu, 27 Jun 2002 08:39:59 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627074001.ZVG2755.mta05-svc.ntlworld.com@there>
References: <1C61B9073EBFBD40B45FA90B8265B2DD1BE8@MELXCHW01.oz.quest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1C61B9073EBFBD40B45FA90B8265B2DD1BE8@MELXCHW01.oz.quest.com>
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
To: netfilter <netfilter@lists.samba.org>

On Thursday 27 June 2002 4:53 am, Loc Huynh wrote:

> Hi Antony,
>
> I have tried this b4, it didn't work with my script, I might missing
> something !!!!!

Okay - in that case put a LOG rule into your FORWARD chain just before the 
end where packets get DROPped, put some packets through to demonstrate the 
problem, and then see what got logged.   This should help you identify what 
rule you need to pass the appropriate packets.

> I should say from beginning that: on a live firewall, I have two NICs, and
> the testing for port forwarding has one NIC, I don't think it make much
> different, doesn't it ?

I might do - it depends what addresses you've applied to the NIC.   If you're 
saying that you have an internal client and an internal webserver on the same 
network range, and you're trying to access the webserver from the client 
using the webserver's external address (which given your above description is 
a possibility, I can't really tell), then you need to read
http://www.iptables.org/documentation/HOWTO/NAT-HOWTO-10.html

If that's not the case, and the LOGging suggestion doesn't help, then post a 
clear description of your network configuration, and the smallest ruleset 
which demonstrates the problem, and we'll see what we can do.

 

Antony.

> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> Sent: Wednesday, 26 June 2002 7:36 PM
> To: netfilter@lists.samba.org
> Subject: Re: Iptables forwarding
>
> On Wednesday 26 June 2002 8:41 am, Loc Huynh wrote:
> > Hi all,
> >
> > I finally had the iptables 1.2.6a installed and it's working great (on
> > Redhat 7.3)
> > However, I have a small problem.
> > I have the following setup for forwarding on port 80 to our IIS web
>
> server.
>
> > $IPTABLES -A FORWARD -i $INTERNALIF -p tcp --dport 80 -j ACCEPT
> > $IPTABLES -A PREROUTING -t nat -p tcp -d $INTERNALIP --dport 80 -j DNAT
> > --to-destination $HTTPFWDIP:80
> >
> > The above worked fine if I have the "FORWARD" to be open to ACCEPT
> > ie: $IPTABLES -P FORWARD ACCEPT
> >
> > Of course, I don't want the default is open to "ACCEPT", is there anyway
>
> to
>
> > avoid this please ?
>
> $IPTABLES -A FORWARD -i $EXTERNALIF -d $HTTPFWDIP -p tcp --dport 80 -j
> ACCEPT
>
> ie: Allow packets from the external interface in to your web server.
>
>
>
> Antony.

