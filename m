From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Re: help with routing/firewall
Date: Thu, 18 Dec 2003 13:15:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <013501c3c592$f845d8d0$7000a80a@melita.com>
References: <007901c3c591$e420f200$3800a8c0@kanux1>
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

SuSE comes with a script called SuSEfirewall that automatically configures
things for you.  You probably don't want that if you're talking to folks on
this list.

See if you have iptables or ipchains -- type iptables-save and if you get
output, post it to the list and we'll see what SuSE is doing firewall wise.

----- Original Message ----- 
From: "Juan Hernandez" <alucard@kanux.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, December 18, 2003 1:08 PM
Subject: RE: help with routing/firewall


> Mmm im not sure if we are able to help you that way. that would be
> making the job for you I guess. correct me if I'm wrong. Read some
> manuals, get a grip in netfilter and if you don't understand something,
> we'll help you.
>
> Juan
>
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Fred Gurn
> Sent: jueves, 18 de diciembre de 2003 14:01
> To: netfilter@lists.netfilter.org
> Subject: help with routing/firewall
>
> Hi,
> I have set up suse linux as bridge/firewall.
> Simple configuration.
> eth0 internet
> eth1 local net
> Everything accepted from eth1, nothing from eth0, traffic from eth1 is
> routed to internet.
> IP forwarding is enabled.
> >From local net I can ping eth1 and eth0 (that means machine is routing
> packets), but I cant go outside eth0. Same happens when ther is no
> firewall. What's the problem with routing?
> What comands can I use to monitor what is happening with packets?
>
> Tahnks in advance.
>   _____
>
> Do you Yahoo!?
> New
> <http://pa.yahoo.com/*http:/us.rd.yahoo.com/evt=21260/*http:/photos.yaho
> o.com>  Yahoo! Photos - easier uploading and sharing
>


