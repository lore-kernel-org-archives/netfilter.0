From: Don Gould <don@bowenvale.co.nz>
Subject: Re: Traffic Accounting on Small System and User Limits.
Date: Fri, 29 Sep 2006 18:58:42 +1200
Message-ID: <451CC422.7050507@bowenvale.co.nz>
References: <359501767.17840@mail.nankai.edu.cn>
	<359505980.29170@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <359505980.29170@mail.nankai.edu.cn>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org



Bo Yang wrote:

> If you just want to get how many bytes a user used in a given range of
> time , iptalbes can do it very nicely !
> iptables -t filter -A forword  -s {your user ip}

Ok, I fried this bit...

I assumed you'd done a type o and 'forword' should be forwArd.

[root@bowenvale ~]# iptables -t filter -A forward  -s 192.168.2.148
iptables: No chain/target/match by that name

I'm sure I'm not understanding something, sorry if I'm being dumb.

Cheers Don
-- 
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz - 
www.bowenvale.co.nz - www.hearingbooks.co.nz - SkypeMe: 
ThinkDesignPrint - Good ideas:  www.solarking.co.nz


