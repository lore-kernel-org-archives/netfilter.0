From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Tue, 21 Apr 2009 13:54:02 -0600
Message-ID: <op.usq1orvex1lyi3@localhost>
References: <20090418082314.GA12566@internet24.de>
 <op.usld3aqfx1lyi3@localhost> <20090418184809.GA15649@internet24.de>
 <op.uslkl80px1lyi3@localhost> <20090418205802.GA16790@internet24.de>
 <op.uslqwresx1lyi3@localhost> <20090419090016.GA19987@internet24.de>
 <op.usn740lix1lyi3@localhost>
 <1240225752.27336.25.camel@enterprise.ims-firmen.de>
 <op.usoy1zlxx1lyi3@localhost> <20090420192600.GB1158@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090420192600.GB1158@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Mon, 20 Apr 2009 13:26:01 -0600, Thomas Jacob <jacob@internet24.de> wrote:

>>
>> iptables -A PREROUTING -i eth0  -t mangle -m state --state ESTABLISHED,RELATED -j RESTOREMARK
>
> This is too restrictive, drop the -i eth0, your forwarded packets from the internet
> will not arrive thru eth0 but still need a CONNMARK -> MARK restore.

Thanks for your help.

I tightened up the policies and added rules to pass any packets, for new connections or otherwise, to or from eth0 (the LAN), and drop NEW connection packets except those from the local machine and from LAN. :

iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD DROP

iptables -t mangle -A INPUT -i eth0 -j ACCEPT
iptables -t mangle -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t mangle -A FORWARD -i eth0 -j ACCEPT
iptables -t mangle -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

However, there is a mistake here.  I am finding that I cannot access local files on the router box from a LAN connected machine (nor can I connect from the router box to Internet) unless I set the policy for INPUT to be ACCEPT.

--
Lloyd
