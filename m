From: Sudhakar Chandra <thaths@openscroll.org>
Subject: Re: Routing between two firewalls
Date: Wed, 23 Jun 2004 18:48:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D98343.5000006@openscroll.org>
References: <40D94B3D.8050308@openscroll.org> <200406231034.54767.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231034.54767.Antony@Soft-Solutions.co.uk>
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

Antony Stone wrote:
> Do you have FORWARDing rules on both gateways allowing TCP port 25 packets 
> from your internal network to the mail server?

Ah, ha!  That was the problem.  The proper FORWARDing rule was absent 
(which is why I had posted to the netfilter mailing list instead of some 
mailing list about routing).  I added the rule and things are going great.

Thanks a bunch.

Thaths
-- 
   "Trying is the first step towards failure." -- Homer J. Simpson
Slacker Without Borders                        http://openscroll.org/
Key fingerprint = 8A 84 2E 67 10 9A 64 03  24 38 B6 AB 1B 6E 8C E4

