From: "Aaron P. Martinez" <ml@proficuous.com>
Subject: Re: delay
Date: 31 Oct 2003 14:16:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067631386.12008.18.camel@aaron-rh9-ws.proficuous.com>
References: <1067626591.1451.21.camel@pauloric.intranet>
	 <20031031191507.GC30565@cannon.eng.us.uu.net>
	 <Pine.LNX.4.51.0310312025050.16998@dns.toxicfilms.tv>
	 <20031031200702.GE30565@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031031200702.GE30565@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Maciej Soltysiak <solt@dns.toxicfilms.tv>, Paulo Ricardo Bruck <pauloric@contato.com.br>, netfilter@lists.netfilter.org

On Fri, 2003-10-31 at 14:07, Ramin Dousti wrote:
> On Fri, Oct 31, 2003 at 08:25:45PM +0100, Maciej Soltysiak wrote:
> 
> > > But in case of SMTP it also might have something to do with ident
> > > being dropped...
> > I do not think i have seen SMTP use ident, ever.
> 
> No but sendmail (an SMTP server) uses ident back to the client to verify.
> Have you ever seen this before?
Also, depending on what pop/imap server you're using...it will also use
ident...You can get around this using UofW imapd and popd by commenting
out the appropriate line in the xinetd.conf

Aaron
> 
> Ramin
> 
> > 
> > Regards,
> > Maciej
> 


