From: uniplex <uniplex@maximum-linux.net>
Subject: Re: -m recent
Date: Fri, 24 Jan 2003 02:03:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E309EFA.4060605@maximum-linux.net>
References: <3E2FEA1C.9030305@maximum-linux.net> <20030123191505.GL484@ns.snowman.net> <3E301172.101@maximum-linux.net> <20030123224028.GM484@ns.snowman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Stephen Frost wrote:

> It'd be before the -j DROP to see if that fixes it.  Recent versions of
> ipt_recent will print out to your kernel log (which you can usually see
> via dmesg) what version of ipt_recent it is.  If you're not seeing that
> then you probably want to try and get a later version.  The latest
> 'released' version is on my website,
> http://snowman.net/projects/ipt_recent/ .  There have been a number of
> bug fixes, however, and so if you want to try my current 'beta' you can
> download it from:
> http://snowman.net/projects/ipt_recent/ipt_recent-0.2.6.tar.gz .
> I've had alot of good responses to the beta so I'm planning on
> releasing it when I have some time to do the 'paperwork'.  My son was
> born a week ago and I'm still pretty busy with him tho. :)
> 
> 	Stephen

Congrats! :)

I found this in dmesg

ipt_recent v0.2.3: Stephen Frost <sfrost@snowman.net>. 
http://snowman.net/projects/ipt_recent/

Do you know where I can find a guide or howto for installing your patch? 
I'm not to swoft with those types of things, I've used patch and diff 
only one time that I can remember.

Thanks.


