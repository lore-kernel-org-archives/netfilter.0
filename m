From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Wed, 19 Jun 2002 11:20:11 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020619152011.GJ26150@cannon.eng.us.uu.net>
References: <3D0BBC45.5000807@palaver.net> <200206152233.g5FMXPA27757@Networker.rockstone.co.uk> <20020616001745.N2090@funkyjesus.org> <20020618171543.919DF681A5@engenho.terra.com.br> <20020618185005.GC26150@cannon.eng.us.uu.net> <20020618202115.32CD7C94DF@srv11-sao.terra.com.br> <20020618225058.GC27054@cannon.eng.us.uu.net> <20020619143545.BDDB2680D7@engenho.terra.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020619143545.BDDB2680D7@engenho.terra.com.br>
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

On Wed, Jun 19, 2002 at 11:36:33AM -0300, Rodrigo Senra wrote:

> |On Tue, 18 Jun 2002 18:50:58 -0400
> |Ramin Alidousti <ramin@cannon.eng.us.uu.net> wrote
> | about Re: Completely NAT an ISP: A practical possibility?:
> 
>  >> On Tue, Jun 18, 2002 at 05:22:03PM -0300, Rodrigo Senra wrote:
> > 
> > 
> > Just a small note. FTP is one of the protocols that would break...
> 
> Hi,
>   could you care to explain me how it would break ? Since it is working
>   here ;o), I think we are discussing different scenarios

I defer this explanation to the documents available about the NAT
and FTP. You can start with the netfilter documents on the need
for ip_nat_ftp. Also the FTP protocol and more specifically the
PORT command would give you what you're looking for.

>   because of my poor explanation on the matter.

No, not at all.

Ramin

> 
>  But I think I can gain a lot from your explanation.
> 
>  TIA,
>  Senra 
> -- 
> Rodrigo Senra         
> MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
> http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

