From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: h323 ALG .
Date: Tue, 22 Jun 2010 12:42:21 +0530
Message-ID: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=HGQ8k5c/ml1HdNMNKd6HdNxsqBPI6oUT2eTNZDNw0lw=;
        b=FSoPKBdbGZd+aDHrXmvlX5ixRE03DCw9FeRk7oOpeSmwPeX4rZnZaMKVgu4NN9SeQ/
         IjoEhjsxsefW/AhkUYdqX1UgaJxWawL1IRVh/6K9Te+5VgjK34awgNzS2wLGPjJKp0MU
         WsHA7RcvvuzwwgZitJfLcwRV4Lj13rIqjucEI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

I have following RULES .


iptables  -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables  -A INPUT -i lan0  -j ACCEPT
iptables  -A INPUT -j DROP

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i lan0  -o wan0  -j ACCEPT
iptabkes -A FORWARD -j DROP

iptables -A OUTPUT -j ACCEPT

But I am able to make H323 calls from lan to wan  &  wan  to lan  .

1.  ALG will allow wan to lan calls ? No need for specific iptables
forwarding rule if alg is needed ?
2.  Is there any way in H323 to have calls without support of ALG (
like passive ftp ? )

Thanks,
Ratheesh
