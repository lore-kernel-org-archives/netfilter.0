From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: RE: Logging default drop
Date: Thu, 8 Apr 2004 18:31:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c41d86$ee20b2c0$0464a8c0@stu>
References: <200404072134.30328.Antony@Soft-Solutions.co.uk>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404072134.30328.Antony@Soft-Solutions.co.uk>
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

Hi All

I enabled the rule at the end of my INPUT tables,
iptables -A INPUT -j LOG --log-prefix "IN-DEfault-drop "

I then tail my messages file and get a LOT of the following....

Apr  8 20:25:04 firewall kernel: IN-DEfault-drop IN=ppp0 OUT= MAC=
SRC=220.255.12.210 DST=x.x.x.x LEN=60 TOS=0x00 PREC=0x40 TTL=40 ID=20518
PROTO=ICMP TYPE=8 CODE=0 ID=256 SEQ=6625

The SRC address is ofter different.
What does this mean?

Thanks
Stu

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, April 07, 2004 10:35 PM
To: netfilter@lists.netfilter.org
Subject: Re: Logging default drop


On Wednesday 07 April 2004 9:29 pm, Stuart Lamble wrote:

> Hi All
>
> Can you LOG a default policy of DROP?

Yes.   Add the LOG rule as the last one in the chain.

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add,
but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the
list;
                                                           please don't
CC me.



---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.654 / Virus Database: 419 - Release Date: 4/6/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.654 / Virus Database: 419 - Release Date: 4/6/2004
 


