From: Martin Skarda <skarda@uni-freiburg.de>
Subject: Re: Problem blocking dhcp discoveries ??
Date: Wed, 22 Mar 2006 18:41:19 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0603221833290.12862@persil.ruf.uni-freiburg.de>
References: <Pine.LNX.4.64.0603142108050.12862@persil.ruf.uni-freiburg.de>
	<25831.217.166.60.19.1143045520.squirrel@ma.rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <25831.217.166.60.19.1143045520.squirrel@ma.rtij.nl>
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

On Wed, 22 Mar 2006, Martijn Lievaart wrote:

> Martin Skarda zei:
>>
>> Where is my mistake? Why do I see all the bursts on my dhcp server even
>> if  the dmesg output and the iptable counters are telling me that the
>> packages  are dropped?
>
> Just a guess, but ISTR that the standard linux DHCP server does not use
> the normal mechanisms, but talks to the network interfaces at such a low
> level that it sees the packets before netfilter.
>

Why sould it do: When I look at the RFCs, I see that bootp is designed to 
use the UDP/IP. It only has to send a ARP request to get the MAC address 
of the client. But this is a normal behavior on a local network segment 
too!

The DHCP server I use, is the standard ISC server.

kindly, Martin

