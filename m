From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Could be a stupid question...
Date: Mon, 17 May 2004 11:26:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405171126.28093.Antony@Soft-Solutions.co.uk>
References: <200405172155.06592.dennis@airstrike.co.nz> <200405171109.50102.gdh@acentral.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405171109.50102.gdh@acentral.co.uk>
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
To: netfilter@lists.netfilter.org

On Monday 17 May 2004 11:09 am, Gavin Hamill wrote:

> On Monday 17 May 2004 10:55, Dennis Morgan wrote:
> > ie SEARCH / and a load of escape characters trying to get unauthorised
> > access. I would like to know if there is a way with netfilter to drop
> > these packets?
>
> At a pinch, you could try the 'string match' module, but it's generally not
> recommended.

I *really* don't think it would work in this case, because the strings will be 
at unpredictable points into the communications stream (less chance of it 
being near the start of a packet, and therefore completely contained within 
one packet), and to do this job effectively you'd need to match on regular 
expressions, which the string match doesn't.

> More usefully, you should look at http://l7-filter.sourceforge.net/ -
> writing a little regex for this package to drop the WebDAV SEARCH requests
> should be trivial.

Good suggestion - less overhead than a full proxy server as I suggested, and 
ideal for the job.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


