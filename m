From: Arne Sagnes <ASagnes@Tickets.com>
Subject: Re: dns server
Date: 06 Jun 2002 10:36:32 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023374193.1070.14.camel@icewind.arne.net>
References: <Pine.LNX.4.21.0206061542060.7290-100000@dns.toxicfilms.tv>
	<200206061548.32785.raymondl@knowledgefactory.co.za> 
	<200206061400.g56E0BA31175@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061400.g56E0BA31175@vulcan.rissington.net>
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
To: NetFilter <netfilter@lists.samba.org>

  DNS, specifically Bind, has options in the named.conf to limit zone
transfers and recursive lookups.  You can use the 'allow-transfer { IP;
IP };' directive to restrict zone transfers.

Arne

On Thu, 2002-06-06 at 10:00, Antony Stone wrote:
> On Thursday 06 June 2002 2:48 pm, Raymond Leach wrote:
> 
> > On Thursday 06 June 2002 15:45, Maciej Soltysiak wrote:
> 
> > > Using netfilter you can not judge whether TCP:53 packet is a zone
> > > transfer or just a query.
> >
> > If you only expect to receive queries from internal interfaces then there
> > should be no 'queries' from external sources.
> 
> Your statement is correct, however it does not help when you are running a 
> domain name server which does need to be accessible from the outside, but you 
> only want people to do standard lookups, and not zone transfers.
> 
> I agree with Maciej - you should set appropriate access controls on the name 
> server itself, because netfilter cannot do it for you.
> 
> 
> Antony.
-- 
Arne Sagnes - Email: asagnes@tickets.com
Work: +1 216 787 8613 - Cell: +1 216 577 2319
Be careful of reading health books, you might die of a misprint.


