From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 14:17:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311261417.22501.Antony@Soft-Solutions.co.uk>
References: <1069853846.3fc4ac966be15@paris-hme1> <20031126151015.GB4486@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031126151015.GB4486@cannon.eng.us.uu.net>
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

On Wednesday 26 November 2003 3:10 pm, Ramin Dousti wrote:

{MX DNS records snipped}
>
> I don't know what you're asking but these are the mx records
> for yahoo and hotmail. Like the following which is the mx for
> megamail.pt
>
> mx.vodafone.pt. 86400   A       212.18.167.163

I suspect (although one can never be sure) that this person is not looking for 
the IPs of the inbound mail servers for Yahoo & Hotmail, but wants to know 
from which IPs mail from those domains will be sent.

I guess this simply because of the word "prerouting" in the question - it 
implies to me packets coming in to the netfilter machine, rather than those 
leaving it and going to the MX systems.

Any further information from zynkx would be useful :)

Antony.

> On Wed, Nov 26, 2003 at 01:37:26PM +0000, zynkx wrote:
> > yahoo and hotmail ip ranges? does anyone knows this ip
> > ranges? need to allow them in my smtp prerouting
> > rulez  :))
> >
> > danke !

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


