From: Tib <tib@firelion.org>
Subject: Re: use of the limiting options
Date: Fri, 28 Jan 2005 15:29:30 -0600 (CST)
Message-ID: <Pine.GSO.4.60.0501281519180.22233@sirius.firelion.org>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
	<20050126161727.GA6583@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050126161727.GA6583@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


> that's a fantastic way to DoS yourself.  so after 8 idiots try to
> connect to your SSH server--you're locked out from connecting yourself
> for an hour...*brilliant*.

Does the limit module not track such things according to source IP then? 
From the sound (snide and condescending as it is) of it, it just counts 
these limit tokens against the destination itself without regard to 
source.

And actually - it would only be 10 minutes, based on the regeneration 
rate.

> - disable password auth on your SSHD and only allow public key auth

This assums a level of competency that the majority of my userbase does 
not have. If you'd like to do desktop support for them to generate keys, 
upload them to the server, and authenticate against them; be my guest.

> - filter access to your SSHD by source IP, if possible

'If possible' - it's not. The majority of my userbase works off dynamic 
ip's. Whether dialup accounts, cable modem, or home-user dsl packages. The 
solution isn't that easy.

> - use some sort of VPN access (IPSec/OpenVPN/etc) to get to your SSHD,
>  and only allow access that way.

See comment to public key auth.


If it were just me using it, this would not be an issue. But there's such 
a thing as 'user friendly' security (honest, I swear), and your offered 
solutions are not it.

How about working with me rather than trying to tell me how stupid I am 
for doing it a particular way?

<EOL>
Tib

