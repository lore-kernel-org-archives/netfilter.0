From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: block + kill connections
Date: Sun, 08 Jan 2006 16:04:49 -0600
Message-ID: <dps2a2$shp$1@sea.gmane.org>
References: <3b29fb790601081344me985167p9c06cf286126ffdb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b29fb790601081344me985167p9c06cf286126ffdb@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

bright true wrote:
> Hello ,
> 
> How to block plus kill all currently opened connections from specific ip address
> 
> on all ports .
> 
> i tryed using :
> 
> iptables -I INPUT -s 1.2.3.4 -j DROP
> 
> but seems to be it doesn't kill the active connections , it works only for new
> 
> incoming connections

That will prevent communication by blocking any further incoming
packets, but won't do anything to tear down the connection.  See
if something like this works better:

iptables -I INPUT -s 1.2.3.4 -p tcp --tcp-flags ! FIN,RST NONE -j REJECT 
--reject-with tcp-reset

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


