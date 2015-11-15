From: Pankaj Yadav <pankajdnapster@gmail.com>
Subject: nftables DNAT change destport
Date: Sun, 15 Nov 2015 16:16:06 +0530
Message-ID: <CAAPqxJwz30Lw5uaF05D=yBxeQ7p_O7EsTEMom1LavERYHgbT5w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=2MWiwahQ+/eS5nwruO67Y2+Zdg+LrtVuaUqBi6uYZLM=;
        b=rDNc28V5OayeUo2G9iLVTX5qTsP6bmVRDHkffOw6jNpaCpludFinVib7ojpbN07VLJ
         KkceQekitUe1YvEnN9uuCOFCjlG1Cl4zqvVBSxVLcOwEbY/B1JiiilHL3sGTjAwUg4SM
         kcgB3S2Eq9bge3q7T4SJ3K9De+7WWeBfUoa5bPhYhL/L1cgzwbDuJMAumJlXrChgxZyb
         mHDCd8sGs0hRJN/1Jpq11DhyJTlMfGXcU0ZtFmsw9ggfohot1i+bmFH5lKH1Yj7EKobZ
         BFVDm/Oymo+cbdj2ZUvV1WX3dZJwheamE3JAOhIyA/LKEVohB6IsSz2GXympZfkGQC9o
         kA2w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to make a DNAT port map using nftables

flush table ip nat
table ip nat {
        chain prerouting {
                type nat hook prerouting priority 0; policy accept;
                dnat tcp dport map { 10737 : 62.210.105.235:8080,
10738 : 62.210.105.257:8081 }
        }

        chain postrouting {
                type nat hook postrouting priority 0; policy accept;
                masquerade
        }
}

but this ruleset produces error: Error: syntax error, unexpected
colon, expecting comma or '}'

What should be the correct syntax if i want to change destport also
corresponding to IPTABLE's (-j DNAT --to 62.210.105.235:8080 ) ?
I have tried several combinations but none works and Google also didnt
help much.Please help me .

--
Regards
