From: "N Gal" <n7799@hotmail.com>
Subject: Re: Iptables forwarding
Date: Thu, 24 Mar 2005 10:19:47 +0000
Message-ID: <BAY21-F16E8DAAD21CC64EA47D1BCA1400@phx.gbl>
References: <200503221047.39552.gdh@acentral.co.uk>
Mime-Version: 1.0
In-Reply-To: <200503221047.39552.gdh@acentral.co.uk>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gdh@acentral.co.uk
Cc: netfilter@lists.netfilter.org



>From: Gavin Hamill <gdh@acentral.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: Iptables forwarding
>Date: Tue, 22 Mar 2005 10:47:39 +0000
>
>On Tuesday 22 March 2005 10:33, N Gal wrote:
> > Hallo,
> >
> > I'm  trying to set up a 'statistics box' that should simply IP forward
> > everything from one ethernet card to the other (Transparent Firewall?) 
>in
> > the same subnet. The problem is that it will not do this. Any 
>suggestions
> > welcome...
>
>You want this : http://ebtables.sf.net
>
>Short version - use a 2.6 kernel and when you configure Linux Bridging
>(interface br0 spanning eth0 and eth1, for example), you will be able to
>apply rules, or simply count the number of packets matching rules /
>interfaces...
>
>If you use a 2.4 kernel, you will need to patch it (see URL above)
>
>Cheers,
>Gavin.
>
>


Hi Gavin,

yes, I found the ebtables site after I sent the message and am using a 2.4 
kernel, so a patch will be necessary.

Do I need iptables as well as ebtables or is ebtables a 'drop-in' 
replacement?

Thanks for the help,

Neil

_________________________________________________________________
It's fast, it's easy and it's free. Get MSN Messenger today! 
http://www.msn.co.uk/messenger


