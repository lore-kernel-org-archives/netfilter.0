From: Shao Miller <Shao.Miller@yrdsb.edu.on.ca>
Subject: Re: Filter MAC Destination
Date: Mon, 18 Jun 2012 11:34:23 -0400
Message-ID: <4FDF4A7F.8000609@YRDSB.Edu.On.Ca>
References: <F0E5F8699DE1364584CDB894E99713552EEE6946@YRDSB5.YRDSB.YRDSB.NET> <alpine.LNX.2.01.1205311918550.13599@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1205311918550.13599@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 5/31/2012 13:19, Jan Engelhardt wrote:
> On Thursday 2012-05-31 19:14, Miller, Shao wrote:
>> I would like to filter Spanning-Tree Protocol data units, which have 
>> a common destination MAC address.  Is filtering based on a 
>> destination MAC address possible, or only based on a source MAC address? 
> It is indeed possible to check for source and/or destination MAC 
> address for STP packets. 

Thanks a lot, Jan.  My guess is that a certain vendor is using netfilter 
"underneath", so I was trying to figure out why their firewalls had the 
ability to filter based on source MAC, but not destination.  So I've no 
idea.

Have a pleasant day.

- Shao Miller
