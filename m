From: Thomas Luening <toml@thlu.de>
Subject: Explanation of 2 Rules
Date: Sat, 22 Aug 2020 12:13:23 +0200
Message-ID: <416b36ac-c17f-0ccd-3d28-cf8e4f3372ae@mail>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello @ all

Can anybody help me to explain und understand this 2 statements?
nft add rule ip filter input "tcp flags & (fin|syn|rst|psh|ack|urg) == fin|syn|rst|psh|ack|urg drop"
nft add rule ip filter input "tcp flags & (fin|syn|rst|ack) != syn ct state new drop"

That's what I think I understood....


TCP-Header first statement:
Bit          11  12  13  14  15  16
Type        URG ACK PSH RST SYN FIN
               0   0   0   0   1   0

             URG ACK PSH RST SYN FIN
XMAS          1   1   1   1   1   1

tcp flags & (fin|syn|rst|psh|ack|urg)  111111   = All flags are set (?) in Packet-Header, because  of   '&' = AND
fin|syn|rst|psh|ack|urg                111111   = Comparison to preprocessor directives = combined with '|' = OR

The result must be 111111 == 111111 to drop. Is that correct?



The second statement:
             URG ACK PSH RST SYN FIN
syn-chk       0   1   0   1   1   1

tcp flags & (fin|syn|rst|ack)           010111  = To much flags are set...
syn ct state new                                = ...because syn-flag is set and ct-state = new

The result must be (10111 != 000010 and ct new) to drop. Is that correct?


Thank you, best regards
Tom
