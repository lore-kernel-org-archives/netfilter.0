From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables problem
Date: Fri, 05 Sep 2008 10:35:51 -0500
Message-ID: <48C151D7.1030309@riverviewtech.net>
References: <1bcb7c7f0809050412g67724c2dl3dfcfb2eb59749b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1bcb7c7f0809050412g67724c2dl3dfcfb2eb59749b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/05/08 06:12, Cam Bazz wrote:
> but no matter what I tried, I could not modify the rules so packets
> coming to eth0:1 port80 do not go to port 8080 on eth0. currently all
> packets routed to eth0:1 port80 goes to eth0 port 8080.
> 
> any ideas/recomendations/help greatly appreciated.

Add the following rule:

    iptables -A INPUT --destination 1.1.1.2/32 -p tcp --dport 80 -m 
conntrack --ctstate NEW -j ACCEPT

This should allow your traffic to come in to port 80 on the new address.



Grant. . . .
