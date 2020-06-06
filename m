From: pauloric@contatogs.com.br
Subject: meta day not working
Date: Sat, 6 Jun 2020 10:10:05 -0300 (BRT)
Message-ID: <269506832.599.1591449005072.JavaMail.zimbra@contatogs.com.br>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com> <20200601124124.GA12580@salvia> <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com> <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com> <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com> <20200602162536.55948b65@redhat.com> <20200602183819.50b4bd84@redhat.com> <000d2e24-1df3-c42a-3117-05d6390194e8@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br AC24D40DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1591449007;
        bh=M4XRFbm5NE9Nemf3yKARhxM+0paz/dd63bnZtJB1qkI=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=huxKA+HXzrJii24Kl374KZMFzwhYoRWpFfhHzNIwh/G0GXqxrwiIBnX/cvfYLM2YQ
         dDbjM9FbV0YU8MN6dZzkdDGdZMZIASWOcy4WHPAN32zJ/+kdxAsE2bBf/IvUIB/Zdt
         bYgDjM+hdSs4v8mXHFqvVoRMiExDyvSGUEz6cTCTh4Zg7LuNXhYuh3OItaOfP1HGlK
         XxC+bbbFIB/Nn+UQRRKl7XpQ8eJMK85AejyMMAc3405n0+fkUKHCYYXxXyAqbXf/6s
         cjiQDIDuqERHRVl/KY5TtnSy2K6WDz0Pc1Bvk2mgG2SavkV0Ai6opWDfqK7y10bG7F
         LEeH+pYgu91Iw==
In-Reply-To: <000d2e24-1df3-c42a-3117-05d6390194e8@softtalker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi all

Hope that everyone is working safety at home.

I have been trying to use meta date , but is not working. I think I could not find the correct syntax, but at list I tried in many tentatives.

Ubuntu server 20.04
kernel 5.6.0-1010-oem and 5.4.0-33-generic
nftables 0.9.3-2 amd64  
libnftnl11 1.1.5-1
libnftables1 0.9.3-2
libnfnetlink0 1.0.1-3build1


Not working:

only meta day
/etc/nftables.d/gerais:17:168-176: Error: Could not parse Day of week of packet reception

add rule inet filter INPUT ip saddr 192.168.0.0/16 meta iifname "wan1" ip protocol tcp tcp dport {53,88,123,135,139,389,445,464,636,3268,3269,5353,1024-5000} meta day "(1,3,5)" counter accept comment "ttttttt"


meta day and meta hour
/etc/nftables.d/gerais:2:189-193: Error: Could not parse Day of week of packet reception
add rule inet filter INPUT ip saddr 192.168.0.0/16 ip daddr 192.168.10.1 meta iifname "lan" ip protocol tcp tcp dport {53,88,123,135,139,389,445,464,636,3268,3269,5353,1024-5000} meta day "1,2" meta hour "8:0" - "18:0" counter accept comment "xxx"



Work if I change meta day and let only one day.


ip saddr 192.168.0.0/16 ip daddr 192.168.10.1 iifname "lan" ip protocol tcp tcp dport { 53, 88, 123, 135, 139, 389, 445, 464, 636, 1024-5000, 5353 } meta day "Monday" meta hour "08:00"-"18:00" counter packets 0 bytes 0 accept comment "xxx"

ip saddr 192.168.0.0/16 iifname "wan1" ip protocol tcp tcp dport { 53, 88, 123, 135, 139, 389, 445, 464, 636, 1024-5000, 5353 } meta day "Wednesday" counter packets 0 bytes 0 accept comment "ttttttt"


What am I doing incorrectly...?

Can't I use more than 1 day in rule _+ time ?

I intend use meta day + meta time as normaly this:

Monday to Friday from 8:00 until 18:00hs.


Thanks for you time

best regards



-- 
Paulo Ricardo Bruck consultor 

