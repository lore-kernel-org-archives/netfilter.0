From: Francis GASCHET <fg@numlog.fr>
Subject: Re: Filtering PPP traffic
Date: Sat, 19 Apr 2003 17:38:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA16D92.2060309@numlog.fr>
References: <20030418193058.17530.qmail@web40202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030418193058.17530.qmail@web40202.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

Yes, but netfilter looks ignoring these packets.

I sniffed them using ethereal. But I've to set manually the "interface" 
to nas0. Ethereal doesn't show it in its list. May be something not 
standard or missing in the eth emulation of this kind of device...
But if I enter "nas0" manually in the "interface" ethereal is able to 
record the data and decodes it.

I think I missed something in iptables working.
I begin to feel that the packets flowing through nas0 disturb iptables 
because they have a 6+2 bytes pppOE header between Ethernet header and 
IP header...
May be a hack is needed in netfilter / iptables...

Any clue ?

F. GASCHET



SBlaze wrote:

>Have you tried filtering on the nas0 device?
>
>--- Francis GASCHET <fg@numlog.fr> wrote:
>  
>
>>Hello,
>>
>>The bridge we use is the kernel patch provided by 
>>http://bridge.sourceforge.net
>>On the card side, we use Ethernet over ATM bridging (RFC 1483/2684 
>>kernel module). It emulates an "Ethernet like" device : nas0.
>>The pppOE daemon sits in the VM where it reads and writes ppp frames on 
>>a virtual eth device created with TAP (http://Vtun.sourceforge.net).
>>The official address is carried by this virtual eth device.
>>The bridge forwards pppOE packets between the nas0 and the tap0 devices.
>>The goal is to use a bridged firewall. That means : a FireWall which is 
>>not visible from the external network.
>>
>>The problem is to be able to filter the pppOE packets that flow across 
>>the bridge.
>>    
>>



