From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: IP-Range and Subnetmask
Date: Thu, 6 Nov 2003 21:27:32 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOKEFLCEAA.markee@bandwidthco.com>
References: <20031105214204.GI30148@iwoars.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031105214204.GI30148@iwoars.net>
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
To: Thomas Themel <themel@iwoars.net>, "Bewerbungsadresse@web.de" <bewerbungsadresse@web.de>
Cc: netfilter@lists.netfilter.org

I think this is what you are looking for:
CLASS_B="172.16.0.0/12"

$IPT -t filter -A SPOOFING_RULES -i $FW_INET_IFACE -s $CLASS_B -j
LOG --log-level $LOG_LEVEL --log-prefix "IP SPOOFING ATTEMPT: "
$IPT -t filter -A SPOOFING_RULES -i $FW_INET_IFACE -s $CLASS_B -j DROP


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Thomas Themel
Sent: Wednesday, November 05, 2003 1:42 PM
To: Bewerbungsadresse@web.de
Cc: netfilter@lists.netfilter.org
Subject: Re: IP-Range and Subnetmask


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
[*Thomas  Themel*]  While differing widely in the various little bits we
know,
[extended contact]  in our infinite ignorance we are all equal.
[info provided in]
[*message header*]      - Karl Popper



