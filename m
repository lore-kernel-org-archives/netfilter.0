From: david NEW <david@hajes.org>
Subject: nftables static routing fails
Date: Mon, 13 Jan 2020 22:13:36 +0100
Message-ID: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1578950016; bh=nYyo9xwmqLCy+xAvJlBsWVrimJlQqAx8eaIKj4Y3G04=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
        b=aQ0XBBDrWdzCgSvYsGL2e5IKyKPQBEZjMx5iVPaRTXMxSrRgXYD6Lxo4XmbQIs9zA
         8yhQi2rb4JQ62IcooSngfy2PSbcdl1YW13mEnlc3Dw7uAadBB3fyMsNxNC4+0+aN6F
         BDpEb6YeZ3EyDpohrgJvb/KQSLx3GTGR3hD/MZX2DZeGYgAiX1L4bUNLcjkTxglV19
         nE+jH69Vdc8mgLiQvGJCkdn19/U5duzk/G+VImtjYjPsxmSDJ/BBjQ1sX05aHEg8UD
         M8ZTjhtex6AmVyeSmireL9C1lloSPH2idq7MNG6tXjR5lnWtwqQo6NhCyW5gpywu6e
         AdxqWQnhGavIA==
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

hi,

I am trying to route blocked ip set to IP:8080 where is info about "you 
have been blocked"

table ip raw {
     set bad_ip {'
         type ipv4_addr
         elements = { xxx.xxx.xxx.xxx }
     }

chain prerouting {

     type filter hook prerouting priority -500; policy accept;
     nft add raw preroute ip saddr @bad_ip tcp dport { 80, 443 } ip 
daddr set xxx.xxx.xxx.xxx tcp dport set 8080 notrack
}

}

netfilter doesn't complain about this rule but nothing 
happens...connection timed out and nothing happened. I see no errors in 
Apache2 logs.

I can see connection attempt in tcpdump but it is not redirected.

any suggestion, please?

