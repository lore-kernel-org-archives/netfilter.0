From: Rodrigo Senra <rodsenra@gpr.com.br>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Tue, 18 Jun 2002 17:22:03 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618202115.32CD7C94DF@srv11-sao.terra.com.br>
References: <3D0BBC45.5000807@palaver.net>
	<200206152233.g5FMXPA27757@Networker.rockstone.co.uk>
	<20020616001745.N2090@funkyjesus.org>
	<20020618171543.919DF681A5@engenho.terra.com.br>
	<20020618185005.GC26150@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020618185005.GC26150@cannon.eng.us.uu.net>
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
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.samba.org

|On Tue, 18 Jun 2002 14:50:05 -0400
|Ramin Alidousti <ramin@cannon.eng.us.uu.net> wrote
| about Re: Completely NAT an ISP: A practical possibility?:

> >  The NAT solution is often used to allow multiple ISP access though the 
> >  same media provider (probably ADSL).
> 
> Doesn't bridged context DSLAM eliminate the need for the NAT?

I humbly confess that I do not know what DSLAM is ;o)

> This would break lots of protocols. How would the clients put up with
> this broken functionality?

Good observation. Yes it breaks some (all not NAT-able), and when this is used
clients have to live up with the limitations. But as I said, for the time being 
this is used to accomodate a multiple-ISP cenario where clients need basically
HTTP, FTP, and less percentage of H.323.  

Take notice that NAT takes place before the packets reach their service providers.
So maybe, I couldn't call it properly  "NAT an ISP" as the title suggests.
 
> Or maybe they tunnel on top of this IP network

Not that I know of.
Thank you for your observations.

regards,
Senra
-- 
Rodrigo Senra         
MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

