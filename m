From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Tue, 18 Jun 2002 14:50:05 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618185005.GC26150@cannon.eng.us.uu.net>
References: <3D0BBC45.5000807@palaver.net> <200206152233.g5FMXPA27757@Networker.rockstone.co.uk> <20020616001745.N2090@funkyjesus.org> <20020618171543.919DF681A5@engenho.terra.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020618171543.919DF681A5@engenho.terra.com.br>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Senra <rodsenra@gpr.com.br>
Cc: netfilter@lists.samba.org

On Tue, Jun 18, 2002 at 02:16:32PM -0300, Rodrigo Senra wrote:

> |On Sun, 16 Jun 2002 00:17:45 +0100
> |Nick Drage <nickd@funkyjesus.org> wrote
> | about Re: Completely NAT an ISP: A practical possibility?:
> 
> >> On Sat, Jun 15, 2002 at 11:33:23PM +0100, Antony Stone wrote:
> > > On Saturday 15 June 2002 11:14 pm, Brian Capouch wrote:
> > 
> > > Some current ISPs already do this, and I guess the popularity with their 
> > > customers varies according to what the customers want to do :-)
> > 
> > Can you name any ISPs that do this?  I haven't seen it in my limited
> > experience.
> > 
> 
>  Here in Brazil this is often used, though I'm not at liberty to name actual
>  ISPs. We have very little H.323 (read Netmeeting) demand, but it is growing.
>  Most ISP clients still have 56Kbps dial-up access, with the number of ADSL
>  clients increasing fast. 
> 
>  The NAT solution is often used to allow multiple ISP access though the 
>  same media provider (probably ADSL).

Doesn't bridged context DSLAM eliminate the need for the NAT?


>   Since there is a law that a 
>  "Content Provider" (like aol,etc) cannot be same as the media provider
>  (like AT&T, etc), which fosters the adoption solution such as that. 
> 
>  In fact, it is not the ISP that is "Natted", but a subset of the client address
>  space before they reach their target ISP, and while in transit in the media
>  provider routers. Naturally, there is some cooking to achieve that. 

This would break lots of protocols. How would the clients put up with
this broken functionality? Or maybe they tunnel on top of this IP network
which is still a huge overhead...and needs additional client-side config.

Ramin

> 
>  I'm not sure if this is the kind of practical appication youe were expecting to hear
>  from, but there is no harm to talk about it anyway....
> 
>  regards,
>  Senra
>    
> -- 
> Rodrigo Senra         
> MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
> http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

