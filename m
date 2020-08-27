From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: nftables map with numgen type, not sure if it was implemented?
Date: Thu, 27 Aug 2020 18:34:35 +0300
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAGg7dk9mYqJGhbBt3m/ghGwBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABJQLj6e+mFSq/mTrWisCc4AQAAAAA=@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=return-receipt-to:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:content-language:thread-index;
        bh=YtsE9DUzJRwjL2enoToGcKbKTSuu3mcWmKYW3jxXGCA=;
        b=JbVY7mgohQ4yEulgB5MihfSXbM8The/Hk/vc9Fmb/P1hX+Q7cdZK7vCcSrNNeW7fSr
         aZYBEvIC8mptJ4LzD7qpUxkDKFok4C1FMyKhF7G8cRf3ECxKP0FdyG0UXSJrfROg/BFK
         BtWk3GCiX34RmitHzRA0SbTXlJ9Vv6Y3RX262W7+8eUMwnO95p/qjYOLfwTuDPPphuwe
         dyFkxU8k0E1TwQoc07QOaQe8N2zWrmel+bf4OlWgpZDRReH9m9VZbabZaKgiTa6ie4S3
         4Br2w8nC3UrWLFc2dksZT04xXhXuaknLXw+XtPaw6sa0c2oobvrYM5phnHJpD26KDp/A
         IJ4w==
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I was reading the at Netfilter-devel:
https://lore.kernel.org/netfilter-devel/20191204223215.GX14469@orbyte.nwl.cc
/T/#mbbcfec07dc54754144aa06cd7bb098b66d9d1da6

and have seen the command:
nft add map t m2 '{ type typeof numgen random mod 2 : verdict; }'

which is something that might be able to help me.
I am trying this on Alpine linux latest stable and I receive an error:

b-r4:/tmp# nft -nnn list ruleset
table ip dummyTable {
        chain dummyChain {
                type nat hook input priority 0; policy accept;
                ct state 0x2 accept
        }
}
table netdev nftlb {
        chain ingress-eth0 {
                type filter hook ingress device "eth0" priority 100; policy
accept;
                ip daddr 192.168.112.100 ip protocol 17 counter packets 0
bytes 0 jhash ip saddr . udp sport . ip daddr . udp dport mod 2 vmap { 0 :
jump Node1, 1 : jump Node2 }
                ip daddr 192.168.112.100 ip protocol 6 counter packets 126
bytes 8504 jhash ip saddr . tcp sport . ip daddr . tcp dport mod 2 vmap { 0
: jump Node1, 1 : jump Node2 }
        }

        chain Node1 {
                counter packets 66 bytes 4448 ether saddr set
00:15:5d:89:c6:eb ether daddr set 00:15:5d:89:c6:e3 ether type 0x0800 fwd to
"eth0"
        }

        chain Node2 {
                counter packets 60 bytes 4056 ether saddr set
00:15:5d:89:c6:eb ether daddr set 00:15:5d:89:c6:f4 ether type 0x0800 fwd to
"eth0"
        }
}
lb-r4:/tmp# nft add map nftlb m2 '{ type typeof numgen random mod 2 :
verdict; }'
Error: syntax error, unexpected typeof
add map nftlb m2 { type typeof numgen random mod 2 : verdict; }
                        ^^^^^^
Error: No such file or directory; did you mean table 'nftlb' in family
netdev?
add map nftlb m2 { type typeof numgen random mod 2 : verdict; }
        ^^^^^
lb-r4:/tmp#


Am I right for even trying it?

Thanks,
Eliezer


----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com


