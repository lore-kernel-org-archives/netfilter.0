From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 10:54:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031126155448.GC4486@cannon.eng.us.uu.net>
References: <1069853846.3fc4ac966be15@paris-hme1> <20031126151015.GB4486@cannon.eng.us.uu.net> <200311261417.22501.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200311261417.22501.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Nov 26, 2003 at 02:17:22PM +0000, Antony Stone wrote:

> I suspect (although one can never be sure) that this person is not looking for 
> the IPs of the inbound mail servers for Yahoo & Hotmail, but wants to know 
> from which IPs mail from those domains will be sent.
> 
> I guess this simply because of the word "prerouting" in the question - it 
> implies to me packets coming in to the netfilter machine, rather than those 
> leaving it and going to the MX systems.

Yes. Your explanation sounds logical and I just examined the incoming emails
from yahoo and they seem to come from webXXXXX.mail.yahoo.com. And, hey, they
run qmail (another victory for qmail).

Ramin

> 
> Any further information from zynkx would be useful :)
> 
> Antony.

