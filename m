From: "Craig Bernstein" <cbernstein@cbernstein.com>
Subject: Re: Logging NAT Translations
Date: Wed, 6 Jun 2007 00:15:54 -0700
Message-ID: <ae1f24730706060015j40c0fe5ek78a81c8816a0c5b5@mail.gmail.com>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
	<Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr>
	<ae1f24730706051910o2538955drfc7ec59cf9aa3927@mail.gmail.com>
	<Pine.LNX.4.61.0706060759470.1547@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0706060759470.1547@yvahk01.tjqt.qr>
Content-Disposition: inline
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On 6/5/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> iptables -t nat -N ydm1
> iptables -t nat -A ydm1 -j LOG "[Adress got SNATed to 134.76.13.21] "
> iptables -t nat -A ydm1 -j SNAT --to 134.76.13.21
>
> iptables -t nat -A POSTROUTING <-d condition -m condition or whatever> -j ydm1
>
> It already was a complete example. When you SNAT, you know you do.

--to-source can be (and is, in this case) a range of IP addresses.  I
know I SNATed, but not to which source IP address and port.

-- 
...Craig

