From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables DNAT algorithm -- another way?
Date: Fri, 12 Dec 2014 19:50:59 -0500
Message-ID: <201412121950.59768.neal.p.murphy@alum.wpi.edu>
References: <548B8069.4020802@brandeis.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <548B8069.4020802@brandeis.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday, December 12, 2014 06:55:21 PM John Miller wrote:
> Hi folks,
> 
> We're running a server that scan local systems for installed SSL
> certificates.  Problem is, the tool truly means local -- RFC1918 private
> ranges only, please.  Being a university, we have quite a few things
> located in public IP space that aren't necessarily world-accessible
> (development servers and the like).
> 
> My solution thus far has been to use DNAT to trick our scanning program
> into thinking it's using local addresses.
> 
> iptables -t nat -A OUTPUT -d 172.16.x.y -j DNAT \
>      --to-destination 129.64.x.y

This might point you in the right direction:

iptables -t nat -A PREROUTING -s 172.16.0.0/16 \
  -j DNAT --to-destination 129.64.0.0-129.64.255.255

But I don't know if it provides predictable 1:1 mapping.
