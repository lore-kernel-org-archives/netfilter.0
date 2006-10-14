From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Can't get access to local servers using external IP
Date: Sat, 14 Oct 2006 18:34:45 +0200
Message-ID: <453111A5.8000603@rtij.nl>
References: <BAY102-F34366D66CEBC07CEBB779FBC0A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F34366D66CEBC07CEBB779FBC0A0@phx.gbl>
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
To: Patrick Cummings <cummingspatrick@hotmail.com>
Cc: netfilter@lists.netfilter.org

Patrick Cummings wrote:

> Hi,
> I've already posted this but it looks like it has been deleted or 
> somehow was not sent.
>
> I have setup a linux router for my network. Everything works well 
> except one thing.
> It has three network connections. One is the Internet, another is a 
> bridge of network cards that is the LAN and the last one is a separate 
> network used as a SAN.
>
> The problem is that I can't access the local servers with the external 
> Internet IP.
> This worked before when I had my POS linksys router that I smashed 
> into pieces after the linux router was setup because I hated it.
> This creates some problems. For example, if I host something on my 
> local webserver (192.168.0.2) and somebody links to it from a webpage 
> on an external server and I click on it I can't get access. However it 
> would work if I was not a the LAN. So if I replace the IP address in 
> the link with the one of my LAN it will work. However that's a real 
> mess, if there is a page with like 50 pictures the 50 pictures will 
> load for everybody except the ones that are on the lan except if they 
> were to click on each picture manually and edit the adress so that it 
> contains the LAN IP.
> Also I always need to log remotely to an outside computer to test if 
> services are accessible with the internet IP.
>

Your workstation sends a packet to $public_ip, which gets DNATted to 
192.168.0.2. The webservers sees a packet from $workstation so responds 
there. That return packet never traverses the firewall again, as 
$workstation is on the same local subnet. Your workstation is expecting 
a reply from $public_ip, so it ignores the return packet from 192.168.0.2.

There are several ways you can make this work.

1) When packets from $local_lan arrive destined for the webserver, not 
only DNAT them, but SNAT them as well to an ip of the firewall. The 
disadvantage is that the webserverlogs will not acurately report the 
source address for these connections. This is probably what the linksys did.

2) Set up a DMZ, put the webserver in the DMZ. You need another nic in 
the firewall, but it is a very clean solution.

3) Fake a DMZ, don't put another nic in the server but configure two 
network segments on the same phyisical LAN. Dirty. Don't go there unless 
you understand perfectly what it does.

4) Use mod_proxy on the firewall instead of DNAT. I do this all the time 
and it works perfectly. As an added advantage, you can map multiple 
(probably internal) webservers to different paths on your public webserver.

5) Use DNAT on your workstation to translate $public_ip to 192.168.0.2 
(for port 80 and 443). Obviously this doesn't scale, but may be the 
simplest solution.

6) Probably lots of other solutions I didn't think about.

HTH,
M4

