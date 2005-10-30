From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: Same machine source IP modification
Date: Sun, 30 Oct 2005 05:15:24 -0500
Message-ID: <1130667324.18229.36.camel@localhost.localdomain>
References: <018c01c5dd2c$a2388600$6500a8c0@BM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <018c01c5dd2c$a2388600$6500a8c0@BM>
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
To: Insomniac <insomniac@bloodbowlonline.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2005-10-30 at 16:33 +0800, Insomniac wrote:
> My situation is that I want to modify all incoming UDP traffic going to a
> specific port so that the source IP appears to be from the local network. I
> completely realise this creates a problem as far as monitoring traffic goes,
> but that is unimportant at this point. Being on the same machine, I have
> found I cannot use the nat table, so SNAT and MASQUERADE are not available
> to me. Any suggestions on a fast and efficient way to pull this off?
> 
> 
Why can't you use iptables? You should be able to policy route that
traffic through some type of nat capable device.

If you provide some more details about that the real issue is you are
likely to get better responses. I generally see people heading down this
type of path when they have broken network toplogies, and their are many
solutions that can address this.

Ted


