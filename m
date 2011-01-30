From: Patrick McHardy <kaber@trash.net>
Subject: Re: DCERPC - does an add-on exist for netfilter
Date: Sun, 30 Jan 2011 18:00:22 +0100
Message-ID: <4D459926.5080801@trash.net>
References: <AANLkTimMiM=NWeDvhPn_wKfab_sta89wxffMPcX2hMSO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimMiM=NWeDvhPn_wKfab_sta89wxffMPcX2hMSO@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Webster <jwebster@ilstechnology.com>
Cc: netfilter@vger.kernel.org

On 30.01.2011 12:07, Jim Webster wrote:
> Hi.  I am new to the list and also fairly new to iptables and
> netfilter.  Linux and programming - am familiar with.
> Have been tasked to provide a way to move MSMQ (DCERPC?) traffic thru
> our firewall.
> The firewall is a CentOS iptables based box.
> 
> Unfortunately, I do not zet have the customer Wireshark trace showing
> the traffic, specificallz where the  address (and port) is supposedlz
> sent in the pazload.
> 
> A knowledgeable iptables/firewall person on our team has suggested we
> require a netfilter helper routine (ala the ftp connection tracking).
> 
> It seems to me however that instead, some tzpe of adaptive firewall
> technique is required to do this - opening a new NAT for the IP/port
> sent in the pazload and closing it when done.
> 
> If so, can this be done by a simple user app - perhaps a proxy, or
> should it be in the loadable kernel modules as the ftp connection
> tracker is?

Yes, you'll need a connection tracking helper that is able to
parse the DCERPC traffic in order to integrate this with netfilter
and NAT. I've looked into this a while ago, but due to the
complexity of the protocol it is non trivial.
