From: "azeem ahmad" <azeem484@hotmail.com>
Subject: Re: smtp
Date: Fri, 14 May 2004 12:07:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F11n0swXX1sPt0005ad74@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

thanks a lot Mr. Gavin Hamill
but i have blocked all the port 25 traffic even then the infected ip which 
is 192.168.0.105 is reciving smtp from many ip addresses from out side
the script i run is as follow
---------------------------------------------------------------------------------------------------
iptables -F
iptables -t nat -F
iptables -A INPUT -p tcp --dport 25 -j DROP
iptables -A OUTPUT -p tcp --dport 25 -j DROP
iptables -A FORWARD -p tcp --dport 25 -j DROP
iptables -t nat -A PREROUTING -p tcp --dport 25 -j DROP
iptables -t nat -A POSTROUTING -p tcp --dport 25 -j DROP
--------------------------------------------------------------------------------------------------------
i flushed iptables first so no other contradictory rule can exist there but 
even then the traffic is coming
what can be the problem

Regards
Azeem


>From: Gavin Hamill <gdh@acentral.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: smtp
>Date: Fri, 14 May 2004 12:37:08 +0100
>
>On Friday 14 May 2004 12:17, azeem ahmad wrote:
> > hi all
> > i m havingg a continous upload on port 25 but i m unable to know which 
>ip
> > from my network is uploading on port 25. i saw on iptraf that some one 
>is
> > continously uploading on 25. the hardware addresss that iptraf is 
>showing
> > isnt really on my LAN but the traffic is coming from my LAN
> > how can i find out the real hardware address or ip of the machine 
>uploading
>
>iptraf is a useful tool for some purposes, but here tcpdump would be more
>appropriate. Install it, and try
>
>tcpdump -n port 25
>
>You may need to specify the eth device with "-i eth0" etc.
>
>It should be obvious very quickly which address on your LAN is generating 
>the
>traffic (the machine will almost certainly be a Windows box with a virus).
From then, you can issue
>
>$ iptables -A FORWARD -p tcp -i ethX -s X.X.X.X --dport 25 -j DROP
>
>And this will immediately stop all traffic from IP address X.X.X.X coming 
>*IN*
>to ethX on your firewall.
>
From there, remove the virus and then undo the above line. (replace -A with
>-D)
>
>Cheers,
>Gavin.
>

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


