From: "robee" <mlody@elpec.com>
Subject: Re: one rule to create per IP connlimits?
Date: Sat, 22 Apr 2006 12:10:35 +0200
Message-ID: <006201c665f5$00205670$0e01050a@CyberAdmin>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
Reply-To: robee <mlody@elpec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "rabbtux rabbtux" <rabbtux@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 21, 2006 9:01 PM
Subject: one rule to create per IP connlimits?

> All,
> Is there anyway I could create a rule that would create a tcp
> connection limit (say 20) for traffic from say 10.10.2.96/27 that
> would apply to each of the 32 IPs.  That is each address,
> 10.10.2.96-127 would be limited to 20 connections??  Or do I need to
> make up one iptables rule per address?
> It sure would be nice if I could do this with one rule per address
> block, as I have several hundred addresses to limit!
> Thanks in advance - marshall

maybe this way:

iptables -I FORWARD -p tcp --syn -s 10.10.2.96/27 -m 
connlimit --connlimit-above 20 -j REJECT

or

iptables -I FORWARD -p tcp --syn -m iprange --src-range 
10.10.2.96-10.10.2.127 -m connlimit --connlimit-above 20 -j REJECT



robee 


