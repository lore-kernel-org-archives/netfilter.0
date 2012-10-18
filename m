From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: servers redirection
Date: Thu, 18 Oct 2012 23:13:24 +0200
Message-ID: <508070F4.300@mutluit.com>
References: <032613bb98974765717d7ae8ebe48e3c@imap.cnaf.infn.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <032613bb98974765717d7ae8ebe48e3c@imap.cnaf.infn.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The following link has a solution for a similar scenario
"By using iptables and its masquerade feature, it is possible
to forward all traffic to the old server to the new IP":
   http://www.debuntu.org/how-to-redirecting-network-traffic-a-new-ip-using-iptables


Chiara Simoni wrote, On 10/18/2012 02:39 PM:
> Hi,
> I need to redirect all requests to my server "Xserver:Xport", to server "Yserver:Yport".
>
> For some months I've been using these iptables commands,
> with Destination NAT and Source NAT on server "Xserver":
>
> /sbin/iptables -t nat -A PREROUTING  -p tcp -d "$Xserver" --dport "$Xport"  -j DNAT --to-destination
> "$Yserver:$Yport"
> /sbin/iptables -t nat -A POSTROUTING -p tcp -d "$Yserver" --dport "$Yport" -j SNAT --to-source "$Xserver"
>
> Now, these same commands don't work any more,
> and I don't now why.
> Recently the only changes I made on my servers
> is a reboot.
>
> Can you help me?
> Have I made some mistakes on these commands?
>
> Thanks
>
> Ch.


