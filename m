From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: traffic from particular interface..
Date: Mon, 14 Mar 2005 16:58:23 +0200
Message-ID: <1403218a05031406586eef1296@mail.gmail.com>
References: <1403218a0503140417712785fa@mail.gmail.com>
	<200503141422.j2EEMeNW016542@smtp26.wxs.nl>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503141422.j2EEMeNW016542@smtp26.wxs.nl>
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
To: Sietse van Zanen <sietse@wizdom.nu>, netfilter <netfilter@lists.netfilter.org>

My message wasn't a final solution.
I have just given him an example.



On Mon, 14 Mar 2005 15:22:34 +0100, Sietse van Zanen <sietse@wizdom.nu> wrote:
>  And perhaps an:
> 
> iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Mohamed Eldesoky
> Sent: 14 March 2005 13:17
> To: Manish; netfilter
> Subject: Re: traffic from particular interface..
> 
> iptables -A FORWARD -i eth1 -o eth0 -j DROP
> 
> On Mon, 14 Mar 2005 04:03:45 -0800 (PST), Manish <manishsoft@yahoo.com>
> wrote:
> > Hi,
> >
> > I had 3 network interface on my linux box eth0, eth1 and eth2. I want
> traffice from eth1 only pass  from eth2 and eth0 should deny any traffic
> from eth1 but allow from eth2. what firewall rule should i give to do the
> above job.
> >
> > Thanks in advance
> >
> > Manish.
> >
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam protection around
> > http://mail.yahoo.com
> >
> 
> --
> Mohamed Eldesoky
> www.eldesoky.net
> RHCE
> 
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

