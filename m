From: "Mark Fortuna" <mfortuna@atllc.net>
Subject: RE: DirectX 8.1 and NAT
Date: Tue, 3 Dec 2002 16:22:36 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c29b1a$7c1ac7a0$140aa8c0@monster>
References: <1038951209.3ded2329866f0@meth.gravital.net>
Reply-To: <mfortuna@atllc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038951209.3ded2329866f0@meth.gravital.net>
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
To: 'Sherman Boyd' <meekrob@mitosys.com>, 'Andrew Magnus' <xanadian9@hotmail.com>
Cc: netfilter@lists.netfilter.org

It doesn't make any sense.  The only problem I know of is running a game
server behind the firewall.  This causes problems with outside clients
making connections to that host.  This is easily fixed with some NAT
PREROUTING and FORWARD rules.  A specific case would be helpful.

Thanks!

-Mark Fortuna


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Sherman Boyd
Sent: Tuesday, December 03, 2002 3:33 PM
To: Andrew Magnus
Cc: netfilter@lists.netfilter.org
Subject: Re: DirectX 8.1 and NAT

Sounds like a silly rumour to me.  If you have an actual problem you
probably
just need to configure iptables correctly.

DirectX doesn't know (and doesn't care) what kind of routers are on your
network.  It will work the same with a Linksys cablemodem or a Cisco 675
connected to DSL or a Linux firewall.

Best regards,

Sherman Boyd
meekrob@mitosys.com

Quoting Andrew Magnus <xanadian9@hotmail.com>:

> I've heard from a friend who is supposedly *really* big on game design
and 
> functionality.  He told me that everyone he's known and talked to said
it is
> 
> impossible to play network games that use DirectX through a linux
firewall. 
> 
> Is this true?  Or is there a workaround that he (and therefor I) don't
know 
> about?
> 
> If there is a workaround, I'd like to know how to do this.  Thank you.
> 
> _________________________________________________________________
> Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
> http://join.msn.com/?page=features/featuredemail
> 
> 
> 


