From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Command not working  in latest version
Date: 17 Feb 2003 08:30:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045467010.681.100.camel@tux.rsn.bth.se>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E9@EXCHANGE>
	 <002901c2d616$c41d6300$0100a8c0@nikita>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002901c2d616$c41d6300$0100a8c0@nikita>
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
To: "Paulo J. Matos" <pocm@mega.ist.utl.pt>
Cc: Khanh Tran <khanh@slc.edu>, Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-02-17 at 00:54, Paulo J. Matos wrote:

> Hi Khanh,
> 
> I've compiled the kernel specifically like they said in your reference
> except those new options of 2.4.20 but still I get 'Invalid Arguments' from
> iptables 1.2.7a. What's Full NAT in kernel config, is that useful for
> iptables?
> 
> I've run the line:
> # iptables -v -t nat -A POSTROUTING -o eth1 -j SNAT --to 217.129.146.56
> SNAT all opt -- in * out eth1 0.0.0.0/0 -> 0.0.0.0/0 to:217.129.146.56
> iptables: Invalid Argument
> 
> This is indeed strange. Do you have any idea of what could I do now?
> 
> Is there any other iptables command line with the same outcome?

I just have to put an end to this thread :)

The solution is simple, recompile userspace iptables against your new
kernel.
A major NAT patch was included in 2.4.20 that breaks compability so you
have to recompile userspace iptables against the new kernelheaders to
get NAT working again (same for the owner match).

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

