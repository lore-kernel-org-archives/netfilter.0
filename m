From: "Sebastian" <netfilter@basti79.de>
Subject: RE: howto bind Mac to ip address
Date: Mon, 11 Aug 2003 16:51:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c36018$1bcb5d60$0200a8c0@basti79>
References: <007601c35fe1$01eb3d20$142a45ca@shahid>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007601c35fe1$01eb3d20$142a45ca@shahid>
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
To: 'Tariq Anwer' <alien@aol.com.pk>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi!

Just a general hint. If I understand u correcty, you'll bind MAC- to
IP-Adresses to apply different filters/restritions to each clients. But
you have to keep in mind, if the users of the client systems have root
privileges they are able to alter their MAC-Address with most modern
Ethernet-Adapters. Also many Windows-Drivers have these capabilities,
too. This could easily be used to bypass your resriction.

Greets
Sebastian.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Tariq Anwer
Sent: Monday, August 11, 2003 10:17 AM
To: netfilter@lists.netfilter.org
Subject: howto bind Mac to ip address


Hi!

I'm a new to Linux, I want to setup Linux NAT box for a small LAN with
selective services to allow like only browsing for staff and other
services for management like ftp msn chatting etc.
 
1.>  I want to bind each MAC address to his or her assigned IP address
so nobody should mess around to change his or her IP's.
 
2.> I want to allow selective MAC addresses each time, so they are not
allowed to use it all the time or I can block them whenever I want to.
 
I will highly appreciate if anybody could help me or direct me to any
web site or article to build this Box successfully.
 
Best regards,
 
Alien


