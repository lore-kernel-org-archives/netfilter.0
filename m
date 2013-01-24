From: Jean-Michel DILLY <jm@dilly.me>
Subject: ip6tables -S & NPT, bug ?
Date: Thu, 24 Jan 2013 18:15:51 +0100
Message-ID: <AB784066-DF78-45DA-9380-16E9DC8FFA7D@dilly.me>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dilly.me; s=mail;
	t=1359047748; bh=XctuvKMDlPv4yMisC8UgrpM5MdXJePs/zwVSGYEgoSU=;
	h=From:Content-Type:Content-Transfer-Encoding:Subject:Date:
	 Message-Id:To:Mime-Version;
	b=lbAkL7JPtqDrvkvCfyEp1Qelw0/fKUz2PQ0MjchT5QmbF3RIDt2UozwJ+fTqTqJpK
	 2k9bvVajAqbkOEKCE9VPu1yOWNm5BZSsNI+zyXey+4ZeA9KJ4iB9XmLEtl8dmhNbCT
	 KxdSIHmJyo6EtsJURj9vgsU8GWfAw/5zOjneti3A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I have a problem when saving my ip6tables configurations with ip6tables-save or ip6tables -S when using IPv6 NPT.

root@linux:/mnt/kernel# ip6tables -t mangle -S
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT
Target `DNPT' is missing save function

and then it crashes.

Does anyone has this problem ?


Regards,
JMichel