From: "Steele, David S." <daves@xetron.com>
Subject: RE: block downloads on file type
Date: Wed, 23 Apr 2003 18:12:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <69B1CAEF4FC66F4D9A07B903E0265D3F01A623@s3cin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org
Cc: 'NetSnake' <netsnake@963.net>


What if I want to prioritize/shape traffic based on file type? Is there some
way to mark subsequent packets in the same TCP connection?

-----Original Message-----
From: NetSnake [mailto:netsnake@963.net]
Sent: Wednesday, April 23, 2003 4:26 AM
To: netfilter@lists.samba.org
Subject: Re: block downloads on file type


May be you can use iptables string match patch, or use Squid + iptables.

>hi guys,
> is there anyway in which we can block a certain file
>from being downloaded ? i mean i need to block mp3
>downloads, is there anyway the linux box can
>understand the file type while downloading it ... 
>
>please put some light on it even if u have the
>slightest idea, it might lead me to some result
>
>thanks a lot
>hemant

