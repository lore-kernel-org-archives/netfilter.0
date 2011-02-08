From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Mon, 07 Feb 2011 22:20:35 -0400
Message-ID: <1297131635.3956.5.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>
	 <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
	 <1297011729.1613.50.camel@andybev>
	 <1297034845.3928.23.camel@debian-laptop.OptimumWireless>
	 <1297126577.1742.34.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1297126577.1742.34.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-02-08 at 00:56 +0000, Andrew Beverley wrote:
> tc-viewer --iface=eth0 --zero --counter=1 --unit=kbit

I ran tc-viewer but, some of the values doesn't make sense or do not
match:

 2:1085               <  739000bit -  739000bit >      0.0 kbit/s  (
0pps)
 2:1087               <  739000bit -  739000bit >    403.0 kbit/s
( 36pps)
 2:1089               <  739000bit -  739000bit >      0.0 kbit/s  (
0pps)
 2:1091               <  739000bit -  739000bit >      0.0 kbit/s  (
0pps)
 2:1093               <  739000bit -  739000bit >      0.0 kbit/s  (
0pps)
 2:1095               <  739000bit -  739000bit >    941.4 kbit/s
( 82pps)

How come a leaf that's only allowing 739kbit is allowing 941kbit/s ?




