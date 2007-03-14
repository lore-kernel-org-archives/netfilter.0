From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: https on non-standard port
Date: Wed, 14 Mar 2007 09:59:58 -0400
Message-ID: <001401c76641$0dd50480$0419a8c0@fly>
References: <3115d56e0703132353l6773de8av8dcc7db10c618553@mail.gmail.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0703132353l6773de8av8dcc7db10c618553@mail.gmail.com>
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
To: 'afshin lamei' <afshinlamei@gmail.com>, netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> afshin lamei
> Sent: Wednesday, March 14, 2007 2:54 AM
> To: netfilter@lists.netfilter.org
> Subject: https on non-standard port
> 
> Dear all,
> I'm trying to detect the HTTPS traffic which is not on port 443. As
> I've seen in Layer7 documents at http://l7-filter.sourceforge.net
> there is no a predefined pattern for that.

Hi,

I think you may have misunderstood the L7 documentation; L7 can and will
identify SSL (HTTPS) traffic independent of port number.

Here's the pattern it uses:

	
<http://l7-filter.sourceforge.net/layer7-protocols/protocols/ssl.pat>

Cheers,
-pablo


