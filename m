From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: block + kill connections
Date: Sun, 8 Jan 2006 17:20:11 -0600
Message-ID: <200601081720.11675.rob0@gmx.co.uk>
References: <3b29fb790601081344me985167p9c06cf286126ffdb@mail.gmail.com>
	<dps2a2$shp$1@sea.gmane.org> <200601081618.01364.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601081618.01364.rob0@gmx.co.uk>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 2006-January-08 16:18, I wrote:
> On Sunday 2006-January-08 16:04, Robert Nichols wrote:
> > > iptables -I INPUT -s 1.2.3.4 -j DROP
> >
> > That will prevent communication by blocking any further incoming
> > packets, but won't do anything to tear down the connection.  See

Yes, you're right, sorry. I read too quickly. You're saying this:

> ... or simply that a blocked connection has not yet 
> timed out of conntrack or netstat listings.

... and you're right, the REJECT will tell the other end that the 
connection is terminated. But I doubt that the local side will show 
anything different in conntrack or netstat, unless a corresponding 
REJECT rule was used in OUTPUT.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

