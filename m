From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Tue, 18 Jun 2002 18:50:58 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618225058.GC27054@cannon.eng.us.uu.net>
References: <3D0BBC45.5000807@palaver.net> <200206152233.g5FMXPA27757@Networker.rockstone.co.uk> <20020616001745.N2090@funkyjesus.org> <20020618171543.919DF681A5@engenho.terra.com.br> <20020618185005.GC26150@cannon.eng.us.uu.net> <20020618202115.32CD7C94DF@srv11-sao.terra.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020618202115.32CD7C94DF@srv11-sao.terra.com.br>
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

On Tue, Jun 18, 2002 at 05:22:03PM -0300, Rodrigo Senra wrote:

> > This would break lots of protocols. How would the clients put up with
> > this broken functionality?
> 
> Good observation. Yes it breaks some (all not NAT-able), and when this is used
> clients have to live up with the limitations. But as I said, for the time being 
> this is used to accomodate a multiple-ISP cenario where clients need basically
> HTTP, FTP, and less percentage of H.323.  

Just a small note. FTP is one of the protocols that would break...

Ramin

> 
> Take notice that NAT takes place before the packets reach their service providers.
> So maybe, I couldn't call it properly  "NAT an ISP" as the title suggests.
>  
> > Or maybe they tunnel on top of this IP network
> 
> Not that I know of.
> Thank you for your observations.
> 
> regards,
> Senra
> -- 
> Rodrigo Senra         
> MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
> http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

