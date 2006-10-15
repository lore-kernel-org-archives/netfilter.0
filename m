From: "Patrick Cummings" <cummingspatrick@hotmail.com>
Subject: Re: Can't get access to local servers using external IP
Date: Sat, 14 Oct 2006 23:08:43 -0400
Message-ID: <BAY102-F39C2BA72F1E93EAD2DD46DBC080@phx.gbl>
References: <453111A5.8000603@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <453111A5.8000603@rtij.nl>
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
Content-Transfer-Encoding: 7bit
To: m@rtij.nl
Cc: netfilter@lists.netfilter.org

>Your workstation sends a packet to $public_ip, which gets DNATted to 
>192.168.0.2. The webservers sees a packet from $workstation so responds 
>there. That return packet never traverses the firewall again, as 
>$workstation is on the same local subnet. Your workstation is expecting a 
>reply from $public_ip, so it ignores the return packet from 192.168.0.2.
>
>There are several ways you can make this work.
>
>1) When packets from $local_lan arrive destined for the webserver, not only 
>DNAT them, but SNAT them as well to an ip of the firewall. The disadvantage 
>is that the webserverlogs will not acurately report the source address for 
>these connections. This is probably what the linksys did.
>
>2) Set up a DMZ, put the webserver in the DMZ. You need another nic in the 
>firewall, but it is a very clean solution.
>
>3) Fake a DMZ, don't put another nic in the server but configure two 
>network segments on the same phyisical LAN. Dirty. Don't go there unless 
>you understand perfectly what it does.
>
>4) Use mod_proxy on the firewall instead of DNAT. I do this all the time 
>and it works perfectly. As an added advantage, you can map multiple 
>(probably internal) webservers to different paths on your public webserver.
>
>5) Use DNAT on your workstation to translate $public_ip to 192.168.0.2 (for 
>port 80 and 443). Obviously this doesn't scale, but may be the simplest 
>solution.
>
>6) Probably lots of other solutions I didn't think about.
>
>HTH,
>M4

wow thanks a lot that makes perfect sense. I'm for sure going to do #1, as 
it seems the most secure and scalable. Thanks for your time really



