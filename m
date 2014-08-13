From: Tomek L <tl-netfilter@gazeta.pl>
Subject: nftables and FTP connection tracking
Date: Wed, 13 Aug 2014 12:30:00 +0200
Message-ID: <CANfWn6X2w8ZkjwuvU-dwPuCx4ewgsov6=ZLaZOkNvYqUaq-ihw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

Could you have a look at my simple nft firewall script below, I've
used ct related, established, but it doesnt work with passive mode FTP
- the data session on high ports is dropped by firewall. Does NFTables
have connection tracking helper for FTP? If not - is it planned in
foreseable future to add it?

table ip filter {
        chain input {
                 type filter hook input priority 0;
                 dport {21} ct state new limit rate 2/second counter accept
                 ct state {established, related} counter accept
                 counter limit rate 100/second log group 2 prefix
"RULE=Default drop"
                 counter drop
        }

        chain output {
                 type filter hook output priority 0;
                 ct state {established, related} counter accept
        }

}
