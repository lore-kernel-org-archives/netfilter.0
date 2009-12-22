From: "Suganthi K" <sukandas@cisco.com>
Subject: iptable - string matching - from to offset values
Date: Tue, 22 Dec 2009 12:30:29 +0530
Message-ID: <002301ca82d4$73c79de0$5b56d9a0$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a packet with the octets 32,33 having the values 0x21 and 0x12
respectively.

I am trying to filter out the packets using iptables rule 
"iptables -t raw -A INPUT -m string --algo bm --from 31 --to 32 --hex-string
'|21 12|' -j LOG"

This rule filters the packet and I could find it in the logs.

starting with the first octet of the packet at offset 0, the required
pattern "21 12" appears at offset 32 and 33 of the packet.

rule "iptables -t raw -A INPUT -m string --algo bm --from 32 --to 33
--hex-string '|21 12|' -j LOG" fails to filter the packet.

Please let me know if anybody has faced a similar situation before.
Any help on the --from and --to values for string pattern matching will be
appreciated.

Thanks & Regards,
Suganthi

