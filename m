From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 18:01:40 -0500
Message-ID: <200412171801.40729.JALaramie@Loudoun-Fairfax.com>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103319685.3262.34.camel@hubcap.ljm.dom>
Content-Disposition: inline
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

> > Accept traffic from my private LAN.
> >
> > # Special OUTPUT rules to decide which IP's to allow.
> >
> > $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> >
> > To allow outbound traffic. This correct? I had question here.
>
> errr...how about:
>
>   iptables -A OUTPUT -j ACCEPT
>
> or just:
>
>   iptables -P OUTPUT ACCEPT
>
> if someone can change the source IP of packets associated with
> locally-generated packets, you have bigger problems than a firewall rule
> that checks source IPs.

Agreed, but is that any reason to make it easier for them? I use similar rules 
which BTW are out of Oskar's Tutorial. While I thankfully haven't seen it yet 
on a Linux box (and with any luck I won't), on windows boxes it's not unusual 
for programs to create or use interfaces and assign IPs to them and then use 
these interfaces to query your network. AOL does this constantly and although 
I believe they are trying to determine the most appropriate server to assign 
to your connection, it's still unnerving to see public IPs on your LAN.  :-p

Jeff

