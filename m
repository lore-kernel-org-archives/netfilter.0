From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCP /MAC
Date: Sat, 8 Nov 2003 11:29:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311081129.hA8BTgj15423@agate.rockstone.co.uk>
References: <20031108111214.61915.qmail@web60201.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031108111214.61915.qmail@web60201.mail.yahoo.com>
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

On Saturday 08 November 2003 11:12 am, kannel sms wrote:

> Dear Sir ,
>
> if i put in the DHCP server that ip will fixed for the
> relavent user. So i can't server the ip like that .
> Dynamically that all ips must assign to the users.so
> tha's why i try use iptables firewall .

Okay, that's a good reason why you can't use the bootp mode of your DHCP 
server.

> Sir , actually i'm new to iptables . pls guide me how
> to do this configuration for DHCP via iptables .

I still find it hard to believe that your modem users have MAC addresses - 
all dialup systems I have seen use PPP Point to Point Protocol and there is 
no MAC address identifying the remote system.

However, I could be wrong, and the way to check this is with the LOG rule I 
already recommended, so you can see the MAC address and source / destination 
IP addresses of the packets coming in to your netfilter machine.

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.
                                                     Please reply to the list;
                                                           please don't CC me.

