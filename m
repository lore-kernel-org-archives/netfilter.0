From: "Ricardo C" <racham@hotmail.com>
Subject: Re: Stealth on emule.... ======(FOR ANTONY STONE)======
Date: Tue, 8 Jun 2004 13:34:45 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-DAV59JopVHlGPK0002ceb3@hotmail.com>
References: <BAY1-DAV54XsNQptgFr000169b4@hotmail.com> <200406071549.44542.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Hello Antony, I responded you yesterday about the order of you of a list
(iptables -L. . . . ) of rules that I have in my firewall, but the reply was
outside of the thread. You'll find it among yesterday's messages "Stealth on
emule..." From "Ricardo A" or "Ricardo C"... Thanks for your help
Cordially
Richard

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Monday, June 07, 2004 11:51 AM
Subject: Re: Stealth on emule....


> On Monday 07 June 2004 3:34 pm, Ricardo C wrote:
>
> > I have a LAN with Windows XP clients and cablemodem exit to Internet
thru a
> > router Debian Woody with iptables. I need that one of the clients
> > (192.168.111.2) can to download and upload files with eMule. I applied
in
> > the router the iptables rules given by Oskar Andreason in their tutorial
> > and I opened the ports (tcp and udp) 4661, 4662, 4665, 4672, 4711.
> > BUT the eMule continues giving Low ID to client. With an external
> > ports-scan on the router I find that these ports continue presenting to
> > eMule as stealth, in spite of the fact that I opened them. I need to
know
> > if what I made to open these ports is well. Please you could revise the
> > rules that I paste below and tell me if they are OK??? Because if they
are
> > OK my ISP is filtering the ports corresponding to the eMule.
>
> I see no rule in your ruleset allowing those packets through the FORWARD
chain
> on your machine, therefore it won't pass them on to the client?
>
> Maybe I'm missing something because of the layout of the rules - if you
think
> the appropriate FORWARDing rules are there, please post the output of
> "iptables -L -nvx; iptables -L -t nat -nvx; iptables -L -t mangle -nvx"
> because I find this an easier format to understand for such a long
ruleset.
>
> Hope this helps,
>
> Antony.
>
> -- 
> If builders made buildings the way programmers write programs, then the
first
> woodpecker to come along would destroy civilisation.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>

