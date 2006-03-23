From: Martin Skarda <skarda@uni-freiburg.de>
Subject: Re: Problem blocking dhcp discoveries ??
Date: Thu, 23 Mar 2006 15:28:01 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0603231524340.12862@persil.ruf.uni-freiburg.de>
References: <Pine.LNX.4.64.0603142108050.12862@persil.ruf.uni-freiburg.de>
	<25831.217.166.60.19.1143045520.squirrel@ma.rtij.nl>
	<Pine.LNX.4.64.0603221833290.12862@persil.ruf.uni-freiburg.de>
	<4421BA0A.7080107@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4421BA0A.7080107@rtij.nl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Hi Martijn,

On Wed, 22 Mar 2006, Martijn Lievaart wrote:

>
> I don't know why either, but some googling turned up 
> http://www.shorewall.net/dhcp.htm:
>
>>
>>        Note
>>
>>  For most operations, DHCP software interfaces to the Linux IP stack at a
>>  level below Netfilter. Hence, Netfilter (and therefore Shorewall) cannot
>>  be used effectively to police DHCP. The ?dhcp? interface option described
>>  in this article allows for Netfilter to stay out of DHCP's way for those
>>  operations that can be controlled by Netfilter and prevents unwanted
>>  logging of DHCP-related traffic by Shorewall-generated Netfilter logging
>>  rules.
>>

thank you for this link. It will explain this behavior...

kindly Martin

