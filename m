From: Robert White <rwhite@pobox.com>
Subject: Re: nat/forwarding reject - basic question ipt/nft
Date: Mon, 6 Mar 2017 20:04:35 +0000
Message-ID: <baff79d3-5534-676e-3078-15a9bbdecf01@pobox.com>
References: <trinity-262aff1c-8a6f-462f-88c5-52ab1a11aa67-1488029996995@3capp-gmx-bs32>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <trinity-262aff1c-8a6f-462f-88c5-52ab1a11aa67-1488029996995@3capp-gmx-bs32>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Infoomatic <infoomatic@gmx.at>, netfilter@vger.kernel.org

On 02/25/17 13:39, Infoomatic wrote:
> Now I want the host 192.168.200.170 to get an icmp type 3 code 3 return when it wants to connect
> to any ip-address to tcp-port 22. I have tried various ways, e.g.
> iptables -A FORWARD -p tcp --source 192.168.200.170 --dest X.X.X.X -j REJECT
> This rule works but the client does not get notified so when it connects it just gets a timeout

If you want it "for any host" then you don't want a "--dest" stanza at all.

If you want "any host on my subnet" then you need the subnet mask, not 
just any host but just any host on the subnet, you want "--destination 
192.168.200.0/24"

Keep in mind that "0.0.0.0" is a specific address, while "0.0.0.0/0" is 
the range of all possible addresses. Not specifying an address at all is 
functionally the same as specifying the range of all addresses.

If you want it for "tcp port 22" then you need a "--dport 22" stanza.

Note that FORWARD is only for forwarding so if you are testing by trying 
to telnet to the firewall itself then you are hitting the INPUT table 
not the forwarding table.

Use "iptables --list --verbose" to see which rules are being hit by your 
attempted connection. Do this before and after the attempt to see which 
rules' or policy's counter(s) was incremented by the attempt.

So "iptables -A FORWARD -p tcp --source 192.168.200.170 --dport 22 -j 
REJECT" does what you say you want for all hosts _except_ the firewall 
itself.

You may separately need "iptables -A INPUT -p tcp --source 
192.168.200.170 --dport 22 -j REJECT" if you want the firewall itself to 
reject telnet attempts.
