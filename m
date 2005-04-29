From: Michal Ludvig <michal@logix.cz>
Subject: Re: FTP server behind NAT
Date: Fri, 29 Apr 2005 17:31:32 +1200
Message-ID: <4271C6B4.8070808@logix.cz>
References: <4271C141.5050008@logix.cz>
	<20050429052310.GA32353@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050429052310.GA32353@bender.817west.com>
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

Jason Opperisano wrote:
> On Fri, Apr 29, 2005 at 05:08:17PM +1200, Michal Ludvig wrote:
> 
>>3) ip_conntrack_ftp is loaded
> 
> maybe you're just leaving this out, but is ip_nat_ftp loaded as well?

Ehm, no. Shame on me. Now it works, thanks a lot!

Michal Ludvig
-- 
* Personal homepage: http://www.logix.cz/michal

