From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: RE: Logging default drop
Date: Thu, 8 Apr 2004 19:24:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c41d8e$5acdba10$0464a8c0@stu>
References: <20040408170259.GL10272@home.manuelm.org>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040408170259.GL10272@home.manuelm.org>
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

Ok, so what does "toppost" mean?



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Frank
Gruellich
Sent: Thursday, April 08, 2004 7:03 PM
To: netfilter@lists.netfilter.org
Subject: Re: Logging default drop


* Stuart Lamble <stu@gateway10.homeip.net>  8. Apr 04:
> Hi All

Hello,

> iptables -A INPUT -j LOG --log-prefix "IN-DEfault-drop "
> 
> I then tail my messages file and get a LOT of the following....
> 
> [logged packet]
> 
> The SRC address is ofter different.

This is normal.

> What does this mean?

Congratulation, you catched a ping.  For complete description read
<URL:http://logi.cc/linux/netfilter-log-format.php3>.  And please, don't
toppost.

HTH,
 regards, Frank.
-- 
Sigmentation fault


---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.654 / Virus Database: 419 - Release Date: 4/6/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.654 / Virus Database: 419 - Release Date: 4/6/2004
 


