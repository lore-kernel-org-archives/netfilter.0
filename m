From: David Cary Hart <DCH@TQMcube.com>
Subject: RE: ipt_string
Date: Mon, 20 Sep 2004 22:32:17 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095733909.2894.2.camel@dchws.tqmcube.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E373@alderaan.smgtec.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E373@alderaan.smgtec.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Mon, 2004-09-20 at 17:43, Daniel Chemko wrote:
> Linux Query wrote:
> > Didn't know about snort. Does it support string matching ?
> > 
> Snrot's generally used for Intrusion detections, but it is basically one
> big string matching program a lot like l7filter that you mentioned in an
> earlier post. I couldn't say which one is better suoted for your needs.
> 
> Snort-inline does take some hand-holding to get started, but I believe
> that more intrusions will be caught through snort than you adding rules
> adhoc to l7filter. 

You might also want to take a look at mod_security for HTTPD protection.
This is a string matcher that allows your to redirect or drop web
attacks independent of IPT. You can even convert snort rules.

BTW, one approach with Snort is to use Swatch to execute rule scripts
for IPT.


