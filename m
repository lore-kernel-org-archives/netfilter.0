From: Mike Lee <curby@cur.by>
Subject: Hashlimit without meters in nftables?
Date: Fri, 1 Oct 2021 01:52:43 -0600
Message-ID: <CALgOszUWXW0Os10SfhafRXjV19J4B9eHaGqyuYMvroONcoJG7A@mail.gmail.com>
Reply-To: curby@cur.by
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cur.by; s=google;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=kIefTTSzVxUg1jHco0HozQrGJhUggEHpIzumEMOFrlg=;
        b=CA0K4JFGx0kUU+JP7aT3Zw0WBLE17EGpo5/Pf0jQBCqLduXxudOcrLKdHTuVyLE3vm
         7n3poQD5ebyLAMM0x/LO75B5d3h+zHQ4UBJmQpPUG5nREGfD8VR+onThcQMmN0MVcOmp
         UicZm3Djx6aJz3SxagA5XTWu3V8sA9AQLLgnE=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

Hi folks, I have a ruleset that I'm migrating from iptables to
nftables. The translation tool used meters for some hashlimit rules,
and I currently have the following lines after some modifications:

tcp dport 22 meter ssh size 65535 { ip saddr timeout 1m limit rate
1/minute burst 1 packets } counter packets 0 bytes 0 accept
ip saddr $trusted_hosts tcp dport 22 meter trustedssh { ip saddr
timeout 1m limit rate 1/minute burst 2 packets} counter accept

The intention is to allow trusted hosts to connect three times within
a minute, but for other hosts to only be allowed to connect once per
minute. This works fine, but uses the meters feature which the
nftables wiki says is obsolete. I have two sets of questions:

1) What are the main downsides of using meters as shown above? Even
the nft wiki Metering page [1] uses meters for hashlimit rules from
iptables, which lends some appearance of endorsement. Will meters go
away in the future?

2) If I wanted to replicate the above behavior using sets, how would I
do so? I spent some time trying to make it work, and modified RedHat's
guide [2] to replicate the behavior of the first rule, but I can't
figure out a way to exempt the trusted hosts.

[1] https://wiki.nftables.org/wiki-nftables/index.php/Meters#Doing_iptables_hashlimit_with_nft
[2] https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using_nftables_to_limit_the_amount_of_connections

Thanks a million!

--Mike
