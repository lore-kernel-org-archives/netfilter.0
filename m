From: Ola Nilsson <ola@fam-nilsson.org>
Subject: Re: IPSec through my firewall
Date: Tue, 15 Feb 2005 23:00:13 +0100
Message-ID: <87oeelpjpu.fsf@helmut.nilsson.homedns.org>
References: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>
	<20050215150707.GA19171@bender.817west.com>
Mime-Version: 1.0
In-Reply-To: <20050215150707.GA19171@bender.817west.com> (Jason Opperisano's
	message of "Tue, 15 Feb 2005 10:07:07 -0500")
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
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason Opperisano <opie@817west.com> writes:

> On Tue, Feb 15, 2005 at 11:25:58AM +0100, Ola Nilsson wrote:
>> Which is far to open, but I used it to try to find the problem. What I
>> see with Ethereal is that the connection seems to have two
>> phases. Both phases uses UDP on port 4500. In the first phase ISAKMP
>> is used, then ESP.

...snip

> "this is what you see" where?  what is this the output of?  where is
> this output being generated?

First, to all that replied, thanks for your help!

I will try to read up on the RFCs. Might be that I was fooled to
believe that NAT-T was used due to some log entries in the
clients. Now I understand that I should be looking at the ESP traffic,
since that should not necessarily NAT OK. Is this why the kernel helps
me, and refuses to NAT the ESP packages?

Regarding where the output was from, it was what I see listening on
both interfaces of the firewall with Ethereal. Even though my
understanding also was that other ports than 4500 should have been
used, all traffic is on port 4500 (nothing on 500).

Regards, 
-- 
/Ola Nilsson


