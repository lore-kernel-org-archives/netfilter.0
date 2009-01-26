From: aras as <arunelis007@gmail.com>
Subject: Does ebtables support --arp-opcode on vlan's?
Date: Mon, 26 Jan 2009 11:54:41 +0200
Message-ID: <8ffbf9ad0901260154l4162bcb2p8e343973c7591182@mail.gmail.com>
References: <8ffbf9ad0901260146g15fee7abu1effb4e6e962530a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=noI2ghaDY0tBQQLxg6adJWkLfglLcGB8SR4LAheS3S8=;
        b=mnq1pvu3MoOpDvn9PI71/Ck9BEaUOSdXH/j6CGmalTII5Jh6BstcmHhDR1UQO1HpeA
         G7ZacJnzRM4nHgX5wBgYX36li9u1Cz18maH2QDUTx0RzCECZnpYGXLUSD2QVlXWEyVxP
         inL/ObwCg7dybTiTX9+lhJand+kuxTlpE1FQE=
In-Reply-To: <8ffbf9ad0901260146g15fee7abu1effb4e6e962530a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have an issue with ebtables --arp-opcode and vlan support.

Ebtables support --arp-opcode witch is used for arp manipulation.

ebtables -t nat -A PREROUTING -p arp --arp-opcode Request -j arpreply
--arpreply-mac 10:11:12:13:14:15 --arpreply-target ACCEPT -i eth1

But it does not work when Ethernet frame comes tag with vlan pid. Can
i overcome this limitation?

Fanks
