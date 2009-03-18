From: AMIT ARORA <amitarora.iitb@gmail.com>
Subject: Destination MAC Address
Date: Wed, 18 Mar 2009 17:43:48 +0530
Message-ID: <c19f67d70903180513u73a559caq1fd193e8f0c34ed1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=b5m+FjLEFTCpn0BBwUejQf2suqddYDbQY2WWTXcLkc8=;
        b=bMHmXlRApeJBkZpWy1N9YZAhO5+9uyBdoWNYauaCgBvO5jD1bBmVyr8JK2YwbN/xnU
         atS1x7jQ2qFS/t+WIpgbZ6Bjeg2RCxPTbrHmY48r3z7TfsSEqt2tV2A1HwaRWpva5FVA
         aolX1zEhPDpPqUOYWjlRfkNiEX9ogUi44pnC0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello guys,
I am new to netfiler. I am hooking the packet from the INPUT hook of
the iptables through libnetfilter_queue. I am able to get the source
MAC address of the captured packet but not the Destination MAc (if it
was a broadcast or addressed to my machine).
Can someone please help

Thanks
Amit

-- 

Rita Rudner  - "Before I met my husband, I'd never fallen in love. I'd
stepped in it a few times."
