From: Christian Ruppert <idl0r@qasl.de>
Subject: SYNPROXY *NAT/redirects etc.
Date: Mon, 22 Jun 2015 15:32:06 +0200
Message-ID: <e662686ca44f5edf617a50d78fa4444d@qasl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I noticed that neither *NAT nor redirects will work when using the 
SYNPROXY module with e.g. those settings:
net.netfilter.nf_conntrack_tcp_loose=0
sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.netfilter.nf_conntrack_tcp_loose=0
sysctl -w net.ipv4.tcp_timestamps=1

iptables -t raw -I PREROUTING -p tcp -m tcp --syn -j CT --notrack
iptables -I INPUT -p tcp -m tcp -m conntrack --ctstate INVALID,UNTRACKED 
-j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

So when doing a redirect for example, the SYNPROXY will open the 
connection to the original destination address and port but it will not 
go through the rest of the iptables rules and thus the redirect/NAT has 
no effect at all. DNAT might be somewhat different though, I wasn't able 
to figure out to where it tries to establish the connection.
If you disable the SYNPROXY it will work as expected.

I saw that a NF_ACCEPT will be used in the module and I assume that's 
why it does not further through the rules. I'm not sure if XT_CONTINUE 
(like in the handshake part) would be possible here or work at all. Or 
is there any other workaround to get this working? Or am I using it 
wrong? Is that by design?

-- 
Regards,
Christian Ruppert
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
