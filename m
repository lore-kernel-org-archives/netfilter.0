From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 17:06:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191706.29142.Antony@Soft-Solutions.co.uk>
References: <4034e313.7746.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4034e313.7746.0@arbbs.net>
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

On Thursday 19 February 2004 4:23 pm, John Black wrote:

> >this assumption is because you're saying 161.x.x.x/21  as destination,
> >all other destinations that doesnt belong to 161.x.x.x to
> >161.x.x+8.x+255 will be not nat'ed
>
> right now i just have 1 class C private network.
>
> At work i have a static class B ipaddress of 161.x.x.x/255.255.252.0 with
> the private class C network 192.168.0.0/255.255.255.0

We are talking about the *destination* address of your packets.

The SNAT rule you currently have:

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -d 161.x.x.x/21 -j 
SNAT --to 161.x.x.x

Says:

 - for packets which have a source address in the range 192.168.0.0/24
 - and are going out of interface eth0
 - and have a destination address in the range 161.x.x.x/21
translate the source address to 161.x.x.x

Any other packets (eg: ones with a destination address of the netfilter 
website server) will not match this rule, and will not be translated.

I think you simply need to remove the "-d 161.x.x.x/21" from your rule and 
things will start working the way you want.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


