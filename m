From: Mike Ireton <mike@WillitsOnline.Com>
Subject: Re: routing broadcast mac ethernet frames
Date: Sat, 05 Feb 2005 14:21:43 -0800
Message-ID: <420546F7.3010907@WillitsOnline.Com>
References: <afcf620205020423242dbf2877@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <afcf620205020423242dbf2877@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joris <joriske@gmail.com>
Cc: netfilter@lists.netfilter.org

Joris -

Very astute of you. Yes, you're right on the money and is a recurring 
'compatibillity' issue between wireless and wired networks.

You can try using the ebtables kernel patch, which will allow you to do 
address translation on the ethernet destination address, so if you see a 
broadcast frame, you can transparently re-write it with your nic's 
ethernet address, thus your ip stack will receive and process the frame. 
There may be some undesired side effects of doing this, depending on 
your specfic configuration and goals, but since you got this far I'm 
sure you can probbly use tcpdump effectively and hash those out.


Mike


>This is why: certain embedded devices, such as some wifi accesspoints
>and some DSL modems, seem to have a common bug/feature.
>They keep an arp table, and any traffic from any host not in that
>table is re-sent with a broadcast mac address (ff:ff:ff:ff:ff:ff).
>
>As far as I know, linux will happily accept packets like that when
>they're adressed to itself, but will not route them. This makes
>communication impossible in certain setups with linux as a router.
>A lot of people, especially wireless communities, are (knowingly or
>more likely unknowningly) suffering from this problem.
>
>Of course, those devices are buggy and should use ARP, but making
>linux 'compatible' is a lot easier than getting multiple hardware
>manufacturers to rewrite their firmware.
>  
>




