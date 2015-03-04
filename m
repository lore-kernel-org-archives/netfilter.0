From: Bob Miller <bob@computerisms.ca>
Subject: packet marking
Date: Wed, 04 Mar 2015 14:04:23 -0800
Message-ID: <54F78167.6070104@computerisms.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have been reading man pages and googling and I am not finding 
understanding.  maybe somebody can explain:

under my mangle table (using iptables-restore to load):

-A PREROUTING -p udp -m udp --dport 4500 -j MARK --set-mark 30
-A PREROUTING -s 192.168.171.0/24 -m mark ! --mark 30 -j MARK --set-mark 40
-A PREROUTING -m mark --mark 30 -j LOG --log-prefix vpnX30
-A PREROUTING -m mark --mark 40 -j LOG --log-prefix vpnX40

This logs packets with both marks.

If I change the LOG target to POSTROUTING, like so:

-A POSTROUTING -m mark --mark 30 -j LOG --log-prefix vpnX30
-A POSTROUTING -m mark --mark 40 -j LOG --log-prefix vpnX40

only packets with the mark 40 are logged.  I think it should log both.

If I consult the nfpacket flow chart, nat/PREROUTING comes after 
mangle/PREROUTING, and I cannot log packets with a mark of 30 there either.

Traffic keeps flowing, so the packets themselves are not being dropped, 
but the mark apparently is not passed from the initial chain. Everything 
I have read indicates it should be.  what could I have done (or not 
done) to make this happen?  Or better yet, what should I be reading that 
would explain this?  I get the feeling I am overlooking something really 
obvious...
-- 
Computerisms
Bob Miller
867-334-7117 / 867-633-3760
http://computerisms.ca
