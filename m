From: Thomas Themel <themel@iwoars.net>
Subject: Re: IP-Range and Subnetmask
Date: Wed, 5 Nov 2003 22:42:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031105214204.GI30148@iwoars.net>
References: <3FA969BA.3090908@web.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3FA969BA.3090908@web.de>
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
To: "Bewerbungsadresse@web.de" <bewerbungsadresse@web.de>
Cc: netfilter@lists.netfilter.org

bewerbungsadresse@web.de wrote on 2003-11-05:
> is it possible to prevent spoofing attacks to 172.16.0.0-172.31.255.255 

> something like that
> iptables -A INPUT -p tcp -s 172.16.0.0/255.31.0.0 -d $INET_IP -i ppp0 -j 
> SPOOFED
> 
> but i think the rule above is wrong

It is. Netmasks are comprised of a sequence of 0..* ones followed by a
sequence of 0..* zeroes, which is why you can write them as /nn, nn
being the number of ones.

255.31.0.0 	= 1111 1111 0000 1111 0000 0000 0000 0000

What you want is

1111 1111 1111 0000 0000 0000 0000 0000 -> /12 if you want it easy,

255.240.0.0 if you like doing binary conversion.


> so: is it possible at all?
> or do i have to write a loop or all single ip-ranges manually?

Not in this case (since you've got an area that fits exactly into a
/12).

ciao,
-- 
[*Thomas  Themel*]  While differing widely in the various little bits we know,
[extended contact]  in our infinite ignorance we are all equal. 
[info provided in]
[*message header*]      - Karl Popper

