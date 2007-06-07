From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Logging NAT Translations
Date: Thu, 7 Jun 2007 10:09:47 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0706071009200.1547@yvahk01.tjqt.qr>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com> 
	<Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr> 
	<ae1f24730706051910o2538955drfc7ec59cf9aa3927@mail.gmail.com> 
	<Pine.LNX.4.61.0706060759470.1547@yvahk01.tjqt.qr>
	<ae1f24730706060015j40c0fe5ek78a81c8816a0c5b5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ae1f24730706060015j40c0fe5ek78a81c8816a0c5b5@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Craig Bernstein <cbernstein@cbernstein.com>
Cc: netfilter@lists.netfilter.org


On Jun 6 2007 00:15, Craig Bernstein wrote:
>
> On 6/5/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>> iptables -t nat -N ydm1
>> iptables -t nat -A ydm1 -j LOG "[Adress got SNATed to 134.76.13.21] "
>> iptables -t nat -A ydm1 -j SNAT --to 134.76.13.21
>> 
>> iptables -t nat -A POSTROUTING <-d condition -m condition or whatever> -j
>> ydm1
>> 
>> It already was a complete example. When you SNAT, you know you do.
>
> --to-source can be (and is, in this case) a range of IP addresses.  I
> know I SNATed, but not to which source IP address and port.

Oh I did not know :-/ I rarely need ranges, mostly because it does not RR over
them like I thought it does :(


	Jan
-- 

