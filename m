From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Port Forwarding Problem
Date: Fri, 25 Apr 2008 14:49:47 -0500
Message-ID: <481235DB.7070705@riverviewtech.net>
References: <4810DCB9.8070208@kiusys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4810DCB9.8070208@kiusys.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/24/2008 2:17 PM, Ivan Hernandez wrote:
> On a LAN a set of computers in the range 192.168.1.x that have already 
> assigned a default gw 192.168.1.1 run an application that must connect 
> to an internet server 234.56.78.9 to the tcp port 4444 much like a 
> telnet app.
> 
> The 192.168.1.1 gw does no serves internet  in any way so the 
> 192.168.1.x network is isolated except for 1 computer, that has 2 nic's 
> and is the computer running linux that i need to configure.

<snip>

Is there something preventing you from moving your Linux system to 
192.168.1.1, i.e. a device that is already there?

If there is a device at 192.168.1.1 what sort of control do you have 
over it?  Can you configure it to use 192.168.1.2 as its default gateway?

I would make your Linux system be the default gateway for the 
192.168.1.x network, either by being 192.168.1.1 or by having 
192.168.1.1 use 192.168.1.2 as its default gateway.

This way, your client systems can use 192.168.1.1 as the default gateway 
for the network, even if it is by way of 192.168.1.2.



Grant. . . .
