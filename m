From: "Eric Wood" <eric@interplas.com>
Subject: Re: H323
Date: Tue, 25 Feb 2003 09:58:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006501c2dcde$55feaf40$9100000a@intgrp.com>
References: <000a01c2dcdb$72762890$0223a8c0@satconet.com>
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
To: netfilter <netfilter@lists.netfilter.org>

I think netfilter can do the job.  You'll need a gatekeeper to do this:

Here's a few:
OpenGK gatekeeper translates between user aliases and IP addresses. Makes
your life easier.
OpenH232Proxy is a gatekeeper with built in proxy feature. It enables the
routing through the gatekeeper of the RTP traffic (audio and video) and the
T.120 traffic (data) so no traffic is directly exchanged between endpoints.
(This one is not in the distro yet.)
OpenMCU H.323 conferencing server lets you hold virtual conferences. simply
connect to openmcu server instead of connecting to another gnomemeeting
client, and you are ready to go. If installed on a firewall (and visible
from both sides), openmcu can serve as a proxy.


I've got OpenH232Proxy sort of working for my cams.
http://openh323proxy.sourceforge.net/

-eric wood


----- Original Message -----
From: "Dhyanesh Ramaiya" <dhyanesh@intafrica.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, February 25, 2003 9:37 AM
Subject: H323


> Greetings,
>
> I am running Redhat 7.3 with Linux kernel 2.4.20 with H323 applied
(compiled
> in the kernel). However, I am still not able to get netmeeting working
over
> the NAT server. Is there any detailed documentation that I could refer to?
> Also, is there any way I could get MSN voice chat and file transfers to
work
> over NAT firewall? I am running iptables-1.2.6a-2 on my NAT firewall. I
have
> a rule in my firewall script that is SNAT-ting all the internal traffic to
> the IP address of the ethernet card connected to the Internet.
>
> Please assist.
>
> Thank you very much.
>
> Dhyanesh Ramaiya
> dhyanesh@intafrica.com
>


