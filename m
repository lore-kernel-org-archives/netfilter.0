From: Steve Horsley <steve.horsley@gmail.com>
Subject: nftables segv while trying to use nat redirection with map
Date: Sun, 18 Oct 2015 13:32:09 +0100
Message-ID: <56239149.2010805@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=UVkI3GSt2okqK8bjAtvOhNSN8/nlDdjGErnPwHx9ixA=;
        b=cvfkDlxwsmGoBcGweFqeUnBVLRAkdLDl88V2PS13RwA5GwvqeUbNCmHaJ6j+3afRd2
         z2qBkO3assKys/16OCRarbmIn1twqAUPLB/6b1KjymE6bqn6E8gcuyGmvxBrR04VPhK/
         Y3NG9t5NGWKI9TioSVlTdvMIQiV6NOzRARkZkJ4A9/Y5oROtNSrctnPDWDaN93GOQea0
         a5dwwEuqeORW9T4Epla1T2TjdPrTv/UhFzaexPON59AxLZIcWuytgijTfexffygqxCO9
         aUT+tu//4UOzbdPFTSQL2JQ8H6EcOq8feHblPjH563kF+I+KyygtziEhREGHZVI4nDO/
         Li1w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I would like to do host redirection using nftables, and using maps for 
efficient host address lookup (thousands of entries).
As a first step, I tried just natting the output from my laptop but the 
real use will be on the prerouting chain:
172.16.0.1 -> 8.8.8.8.
The following works as intended:
     nft add table nat
     nft add chain nat output { type nat hook output priority 0 \; }
     nft add rule nat output ip daddr 172.16.1.1 dnat 8.8.8.8
     ping 172.16.1.1

But I can't get it to work using maps - this causes a segmentation error:
     nft flush ruleset
     nft add table nat
     nft add chain nat output { type nat hook output priority 0 \; }
     nft add rule ip nat output dnat ip daddr map { 172.16.1.1 : 8.8.8.8 }
     nft list ruleset

I don't know if I just have the wrong syntax, if it's a bug in nft, or 
if it's just something I shouldn't be trying to do in the first place. I 
am using nftables 0.4 (ubuntu 15.10 beta) but had the same result on 
ubuntu 15.04.

