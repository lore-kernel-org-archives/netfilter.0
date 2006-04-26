From: Drew Leske <dleske@uvic.ca>
Subject: Re: Login load balancing
Date: Wed, 26 Apr 2006 14:56:35 -0700
Message-ID: <444FEC93.6070101@uvic.ca>
References: <444FAEFF.1040100@uvic.ca> <444FE835.2010007@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444FE835.2010007@gmx.net>
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
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Cc: netfilter@lists.netfilter.org

Hi Carl,

Carl-Daniel Hailfinger wrote:
> what about using a DNS CNAME for bob to bob[368]? If you set the
> TTL low enough and update your DNS server with the latest data
> from your SNMP agents continuously, you will achieve exactly what
> you want without any iptables trickery.
> Such a solution is running here and it works fine.

That's an interesting solution.  I like it.

Unfortunately we don't control the DNS--another group here has
responsibility for that.  I'll chat with them and see if they have provision
for remote updates.

Thanks,
Drew.

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

