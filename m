From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 14:24:43 -0500
Message-ID: <200510111424.43553.rob0@gmx.co.uk>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
	<200510111351.51801.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510111351.51801.rob0@gmx.co.uk>
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

On Tuesday 2005-October-11 13:51, I wrote:
> > iptables: No chain/target/match by that name
>
> I guess this means that your kernel lacks support for the iprange
> target. "CONFIG_IP_NF_MATCH_IPRANGE=m"

Um, that's a match, not a target, but same idea. If it's 2.6.x with 
config.gz enabled:
$ zgrep CONFIG_IP_NF_MATCH_IPRANGE /proc/config.gz
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

