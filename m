From: Shirley Ong <soap6gal@gmail.com>
Subject: Re: Traffic accounting in iptables
Date: Thu, 15 Jul 2010 10:07:24 +0100
Message-ID: <AANLkTilcWL7AiJr6Ps2ckt7dCk1rHqxotkiRt7LdJumq@mail.gmail.com>
References: <AANLkTilT4RX2sRQc7vjtWdbP3UxSqqVFAwGc2mGZk0iC@mail.gmail.com> 
	<alpine.LSU.2.01.1007142038130.28055@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=z8k3eHAiBVSFBDNsE7yOW88NFOe3b22OUMwOQgnxidM=;
        b=FEg683BJz3BOuJCk2uddULVxSy40IVRTwwO/3pJldCFU6BopoJHL9mUk0wVGGNn/7N
         wjgjyukdWrNDnCRc2bGnnxiEKx0Kz+ypnSaCLK0PCMZwctvNyUXoi1vfGqSy5szcoJmR
         8t2ibEmPmEKA368eKO7LPlNKPljGHMyBRm8hk=
In-Reply-To: <alpine.LSU.2.01.1007142038130.28055@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Jan,

Sending ping:

# ping -s 1024 -c 100 google.com

iptables and tcpdump both shows (at IP layer + header):

incoming - 100 packets, 9200 bytes
outgoing - 100 packets, 105200 bytes

This seems fine. But I don't understand why I'm not getting similar
outputs of iptables and tcpdump when downloading a file via wget.


On 14 July 2010 19:39, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Wednesday 2010-07-14 19:00, Shirley Ong wrote:
>>With wireshark, I added up all the bytes (with and without header) at all
>>the different layers. The closest I can get wireshark to show the same
>>data bytes as iptables is at the IP Layer (data + header). What
>>puzzles me is that, wireshark shows 12 bytes (incoming traffic) more
>>than iptables
>
> Can you reproduce this using pings? (The ping program allows to specify
> payload sizes, and thus, exact packet sizes)
>
