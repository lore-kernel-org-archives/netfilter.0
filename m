From: Jason Opperisano <opie@817west.com>
Subject: Re: vpn
Date: Tue, 14 Sep 2004 13:20:33 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095182433.1895.10.camel@wolfpack.ljm.dom>
References: <012a01c49a61$340e8ad0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <012a01c49a61$340e8ad0$49caa8c0@caris.priv>
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
To: netfilter@lists.netfilter.org

On Tue, 2004-09-14 at 09:46, Peter Marshall wrote:
> I need to set up a vpn.  I am trying to figure out which would be best.  I
> need to connect my office with a sister office.  The employess are using
> windows machines.  They want to be able to get and put files from a windos
> file server. Windows networking would be a bonus.  Both offices have Linux
> firewalls.    Would ssh over a PPP tunnel work for this ?  Would pptp or
> cIPe be a better solution ?

IPSec would be the best solution here.  openswan is my stack of choice.

> I have my network setup below ... I was also wondering if it would be better
> to put the vpn server either behind the internal firewall, or in the dmz, or
> make it part of the internal firewall

make it part of either the external or internal firewall.  if you didn't
have public IP's on the internal firewall--the only proper choice would
be the external firewall.  since you mention putting it on the
internal--that would be a fine choice.  do not put it behind the
internal firewall--that would be a bad choice.

-j

-- 
Jason Opperisano <opie@817west.com>


