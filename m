From: Jason Opperisano <opie@817west.com>
Subject: Re: VPN question
Date: Wed, 06 Oct 2004 15:58:06 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097092686.5757.15.camel@wolfpack.ljm.dom>
References: <200410061936.i96Ja0rZ014727@melmac.stargate.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410061936.i96Ja0rZ014727@melmac.stargate.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-10-06 at 15:35, Sunny Shum wrote:
> Hello,
>  
> I am a newbie to the VPN setup.  Currently, my company has a Windows 2003
> server behind a firewall (running iptables on RedHat 9).  I need to setup
> VPN for a few executives so they can access the servers from home or on the
> road.  I did some research and came to 3 options:
>  
> 1. Run the VPN from the Windows 2003 server

don't do this.

> 2. OpenVPN

this is a nice option--not super scalable though.

> 3. OpenSWAN or StrongSWAN

i prefer open to strong, FWIW.
 
> My questions are:
>  
> 1. Is this the right place to ask questions regarding VPN, since this is
> mainly an iptables-related list?  

not really.

> If not, can someone direct me to a
> forum/list which will be helpful?  I really enjoy the information provide
> from this list members.

start by reading:

  http://wiki.openswan.org/index.php/FAQ

then look through the archives/join:

  http://lists.openswan.org/mailman/listinfo/users

 
> 2. If I choose option #2 or #3 above, how to set it up? I read the HOWTO
> documents, but I am not sure where I should install the server side of the
> VPN.  Do I install it on the firewall box?  Or the Windows 2003 box?

the firewall box would be a more logical choice, IMHO.

-j

-- 
Jason Opperisano <opie@817west.com>


