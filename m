From: Scott Gaertner <scott@caffeinemediainc.com>
Subject: Re: iptables 'make' killed my box
Date: Mon, 25 Aug 2003 15:44:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <80B94F2B-D734-11D7-B770-003065A0E6D8@caffeinemediainc.com>
Mime-Version: 1.0 (Apple Message framework v552)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Nathan & Jamie,

Thanks for your responses -- I'm not convinced it was iptables either 
-- I've never seen a crash during a 'make' either -- but that's when it 
happened.  It could have been someone carelessly watering plants as far 
as I know.. :)

I reached the guy who's the normal sysadmin (who can't help today), and 
he thinks that it's *possible* that the make started probing kernel 
modules, and that's what did it.

It's a fairly vanilla Debian box... not overclocked... the only quirky 
module is mod_perl...

Anyway, I just arranged to get keys -- I'm heading over now, and I'll 
post a followup as soon as I can.

Thanks again,

-Scott


