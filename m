From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: 'recent' module HOWTO
Date: Wed, 11 Aug 2004 12:21:42 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2197.216.239.93.106.1092241302.squirrel@216.239.93.106>
References: <4119B0DA.6030903@svw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4119B0DA.6030903@svw.com>
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
To: Sudheer Divakaran <sudheer@svw.com>
Cc: netfilter@lists.netfilter.org

On Wed, August 11, 2004 1:38 am, Sudheer Divakaran said:
> Hi,
>     Where can I find detailed documentation of 'recent' module?.
>

http://snowman.net/projects/ipt_recent/

>
> To test the recent module, I've given the following commands and pinged
> to my machine from another one.  But I got the reply 'Destination port
> Unreachable'.  What is wrong in it?

There's nothing wrong with that.  You did specify to REJECT packets, whic=
h
means that you can send back an ICMP error of your choice.

I guess 'Destination port Unreachable' is the default one.

>
> iptables -F
>
> iptables -P INPUT ACCEPT
>
> iptables -P OUTPUT ACCEPT
>
> iptables -A INPUT -m recent -p icmp --icmp-type echo-request --update
> --seconds 10 -j REJECT
>
> iptables -A INPUT -m recent -p icmp --icmp-type echo-request --set -j
> ACCEPT
>

However, you should be able to get a single ping reply before being
rejected. Is that what happen ?


>
> Kind Regards,
> Sudheer
>

Hope this helps.

Samuel Jean
CookingLinux.org


