From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: External IP addresses on internal network
Date: Thu, 28 Aug 2003 12:19:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4E2B98.7090003@Loudoun-Fairfax.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au> <3F4C0519.8000109@Loudoun-Fairfax.com> <Pine.LNX.4.53.0308270944480.7868@simba.math.ucla.edu> <3F4CFD8C.5020404@Loudoun-Fairfax.com> <008e01c36d7c$6218ca70$6401a8c0@int.thorcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008e01c36d7c$6218ca70$6401a8c0@int.thorcom.com>
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
To: "Michael J. Tubby B.Sc. (Hons) G8TIC" <mike.tubby@thorcom.co.uk>
Cc: netfilter@lists.netfilter.org

Hey Mike,

Michael J. Tubby B.Sc. (Hons) G8TIC wrote:

>What you should be filtering is packet egress, that is your 192.168 or
>whatever internal LAN leaking 'naked' (un-NATted) to the internet at
>large.
>  
>
Yes, I do this. I also filter coming from the LAN on the INPUT table 
since I consider any box a potential risk.

>I do this in two places, on the main firewall box between out "inside"
>and "outside" in iptables and then again at the Cisco router facing
>PSInet with an ACL that drop & log any packets from anything other
>than our PSInet Class-C, so there's no way we can "leak" on to the 'net.
>  
>
My DSL provider owns and maintains my router. I never thought about 
filtering at the router. Hmm, I'll have to ask about that.

Jeff



