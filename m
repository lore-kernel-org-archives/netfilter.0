From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Layer (5,6,7) based NAT
Date: Sun, 29 Apr 2007 19:19:52 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704291919450.22744@yvahk01.tjqt.qr>
References: <44301.80.177.104.4.1177854143.squirrel@webmail.modwest.com>
	<4634CCC9.2000201@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4634CCC9.2000201@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org


On Apr 29 2007 18:50, Martijn Lievaart wrote:
> Adam wrote:
>> I am wondering weather this is possible. I have one port and one public IP
>> address lets say:
>> 
>> 34.123.22.33:5615
>> 
>> If I connect using SSH I want to DNAT to port 22, if I connect using SSL I
>> want to DNAT to port 443, if I connect using HTTP I want to DNAT to port
>> 80.
>> 
>> If this kind of upper layer protocol determination possible? If so, is
>> netfiter the application to do it?
>> 
>
> No, this is not (easily) possible, and certainly not with iptables. The reason
> is that you need a complete three way handshake before data starts flowing and
> you can determine what protocol is spoken. However, NAT must act at all
> packets, from the first. Besides, if you could start NATting at a certain
> point, the recipient would not see the three way handshake, so you cannot
> connect to your final destination.
>
> Your only hope is some kind of proxy. And if you find  it, please let me know,
> I would be very interested as well.

rinetd


Jan
-- 

