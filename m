From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: H323
Date: Sun, 02 Mar 2003 11:41:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20030302113931.0252ceb8@of23sm3.kadnet.dom>
References: <000a01c2dcdb$72762890$0223a8c0@satconet.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006501c2dcde$55feaf40$9100000a@intgrp.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Eric Wood <eric@interplas.com>, netfilter <netfilter@lists.netfilter.org>

Hi

Does anybody know I can use one of these gatekeepers / proxys as a 
transparent proxy for the msn messenger ip telephone client?


Thanks


/Rasmus

At 09:58 25-02-2003 -0500, Eric Wood wrote:
>I think netfilter can do the job.  You'll need a gatekeeper to do this:
>
>Here's a few:
>OpenGK gatekeeper translates between user aliases and IP addresses. Makes
>your life easier.
>OpenH232Proxy is a gatekeeper with built in proxy feature. It enables the
>routing through the gatekeeper of the RTP traffic (audio and video) and the
>T.120 traffic (data) so no traffic is directly exchanged between endpoints.
>(This one is not in the distro yet.)
>OpenMCU H.323 conferencing server lets you hold virtual conferences. simply
>connect to openmcu server instead of connecting to another gnomemeeting
>client, and you are ready to go. If installed on a firewall (and visible
>from both sides), openmcu can serve as a proxy.
>
>
>I've got OpenH232Proxy sort of working for my cams.
>http://openh323proxy.sourceforge.net/
>
>-eric wood
>
>
>----- Original Message -----
>From: "Dhyanesh Ramaiya" <dhyanesh@intafrica.com>
>To: <netfilter@lists.netfilter.org>
>Sent: Tuesday, February 25, 2003 9:37 AM
>Subject: H323
>
>
> > Greetings,
> >
> > I am running Redhat 7.3 with Linux kernel 2.4.20 with H323 applied
>(compiled
> > in the kernel). However, I am still not able to get netmeeting working
>over
> > the NAT server. Is there any detailed documentation that I could refer to?
> > Also, is there any way I could get MSN voice chat and file transfers to
>work
> > over NAT firewall? I am running iptables-1.2.6a-2 on my NAT firewall. I
>have
> > a rule in my firewall script that is SNAT-ting all the internal traffic to
> > the IP address of the ethernet card connected to the Internet.
> >
> > Please assist.
> >
> > Thank you very much.
> >
> > Dhyanesh Ramaiya
> > dhyanesh@intafrica.com
> >


