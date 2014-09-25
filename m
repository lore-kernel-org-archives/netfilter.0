From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Challenge: subnet wildcard or range
Date: Thu, 25 Sep 2014 14:05:05 -0400
Message-ID: <201409251405.05430.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, September 25, 2014 12:00:46 PM Craig wrote:
> Hello,
> 
> Lets say you have different sites 1, 2, and 3:
> 10.0.1.0/24
> 10.0.2.0/24
> 10.0.3.0/24
> 
> Now you want to allow certain traffic to particular IPs on those sites.
> 10.0.1.11/32
> 10.0.2.11/32
> 10.0.3.11/32
> 
> Couldn't you specify a range or a wildcard on iptables like so:
> 
> wildcard
> 10.0.*.11/32
> 
> range
> 10.0.1-3.11/32
> 10.0.1.11-10.0.3.11
> 
> Please consider that the last octet must be equal to 11.

... -d 10.0.0.11/255.255.0.255 ...

and

... -s 10.0.0.11/255.255.0.255 ...

might do the trick. If not, you'll probably have to use the u32 match feature 
(-m u32 --help).
