From: Rodrigo Senra <rodsenra@gpr.com.br>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Thu, 20 Jun 2002 16:37:10 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020620193615.40DDAC87AF@srv9-sao.terra.com.br>
References: <3D0BBC45.5000807@palaver.net>
	<20020618202115.32CD7C94DF@srv11-sao.terra.com.br>
	<20020618225058.GC27054@cannon.eng.us.uu.net>
	<200206200948.g5K9m7U31874@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206200948.g5K9m7U31874@vulcan.rissington.net>
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
To: netfilter@lists.samba.org

|On Thu, 20 Jun 2002 10:48:01 +0100
|Antony Stone <Antony@Soft-Solutions.co.uk> wrote
| about Re: Completely NAT an ISP: A practical possibility?:

 >> On Tuesday 18 June 2002 11:50 pm, Ramin Alidousti wrote:
> 
> > On Tue, Jun 18, 2002 at 05:22:03PM -0300, Rodrigo Senra wrote:
> > > > This would break lots of protocols. How would the clients put up with
> > > > this broken functionality?
> > >
> > > Good observation. Yes it breaks some (all not NAT-able), and when this is
> > > used clients have to live up with the limitations. But as I said, for the
> > > time being this is used to accomodate a multiple-ISP cenario where
> > > clients need basically HTTP, FTP, and less percentage of H.323.
> >
> > Just a small note. FTP is one of the protocols that would break...
> 
> This is, of course, assuming that they only do "simple NAT", rather than 
> implementing netfilter + associated helper modules inside the ISP....
> 

Thank you Antony.

Indeed we were discussing different things! I believe now that Ramin
made reference that protocols would break due to a lack of "connection
conntracking" withou which packets couldn't suffer NAT properly. We have
implemented a rudimentar NAT+conntrack kernel 2.2 patch, because by the time
we netfilter/iptables was not available in all its glory ;o).
What we did was to use a priority queue and hashtables to implement full
NAT to FTP and H.323 only (our immediate needs by then).

We've upgraded the solution to use netfilter/iptables last year.

regards,
Senra 

-- 
Rodrigo Senra         
MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

