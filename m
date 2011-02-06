From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 22:12:05 -0400
Message-ID: <1296958325.3695.15.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus>  <1296923860.1695.20.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296923860.1695.20.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: Marek Kierdelewicz <marek@piasta.pl>, Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>, netfilter@vger.kernel.org

Thank you all for replying and sorry for the late reply.

On Sat, 2011-02-05 at 16:37 +0000, Andrew Beverley wrote:
> On Sat, 2011-02-05 at 15:58 +0100, Marek Kierdelewicz wrote:
> > > Hi,
> > 
> > Hi
> > 
> > >I, are you sure about the big difference?
> > >I agree with you about tc u32 filters are better than iptables +
> > >marking, but like now I have about 100mbit 1k+ users with
> > >mangle+classify and tc+htb+egress and I have a load at about 0.2.
> > >My cpu are xeon 2.6 quad.
> > 
> > Do you have individual iptables rule doing marking for each user (1k+
> > rules in mangle)?
> > 
> 
> I have to admit that I don't mark per user. I have lots of users, but I
> instead mark the type of traffic and shape on that.
> 
> Optimum Wireless Services - what is your aim? Do you really want to
> limit bandwidth per user, or do you instead want to provide each user
> with a fair share of bandwidth and fast internet access? If it is the
> latter, you are better to not mark per user, but instead mark the
> traffic type and use tc's hash functionality to share the bandwidth
> between client IP address, rather than the default which is per
> connection.
> 

What I would love to do is offer "fast internet access" and at the same
time sell packages to users: 512/128, 768/256, 1024/512, etc... If an
user has a specific package, I would like this user to have a nice
internet experience with low pings, and little lagging and not
'interfere' with the other users (might be impossible). 

So, what I'm trying to do is not have issues with one user hogging our
internet line.

Dont know how a fair share bandwidth might work on our network since I
have some users downloading p2p all day long. 

I've noticed that at peak times (7pm - 11pm) our internet service is so
slow I'm embarrassed to even say. 

Also, another thing I noticed (this one not time specific) when running
iptraf is that my external interface measures almost our max/total
bandwidth of 15Mbps and our internal interface is only at 4Mbps. So,
that tells me that not much is passing through squid or there are some
big time downloading going on.

So, to tell you the truth I don't know which way to go if limit bw per
user or what. I'm just trying to keep our network running as smooth as
possible.


> Andy
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

