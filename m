From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: RE: Established related question
Date: Tue, 6 Apr 2004 21:11:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c41c0a$f0c77270$0464a8c0@stu>
References: <200404061955.51301.Antony@Soft-Solutions.co.uk>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404061955.51301.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Once again, perfect sense. 
Thanks
Stuart

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Tuesday, April 06, 2004 8:56 PM
To: netfilter@lists.netfilter.org
Subject: Re: Established related question


On Tuesday 06 April 2004 7:39 pm, Stuart Lamble wrote:

> Hi all
>
> Established relates to packets of known connections and RELATED 
> applies to packets related to packets of an active connection....
>
> What are the implecations of having a rule that states "If state of 
> connection is ESTABLISHED,RELATED - ALLOW" in the INPUT and FORWARD 
> rules?

Sorry, I don't think I understand your question - can you try
rephrasing?

The best attempt I can come up with for an answer is "the implication of

having a rule ACCEPTing ESTABLISHED, RELATED packets in INPUT or FORWARD
is 
that reply packets (as well as things like ICMP errors and path MTU 
discovery) are taken care of and you then only need to specify rules for
the 
NEW packets you want to allow as the first in a connection".

Is that what you were looking for?

Regards,

Antony.

-- 
One good tern deserves another.

                                                     Please reply to the
list;
                                                           please don't
CC me.



---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.650 / Virus Database: 416 - Release Date: 4/4/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.650 / Virus Database: 416 - Release Date: 4/4/2004
 


