From: Yury Polyanskiy <ypolyans@princeton.edu>
Subject: martian destination and RAW iptable
Date: Tue, 27 Jan 2009 18:25:20 +0300
Message-ID: <ea182b20901270725n3fde42e4i166b346a919a3050@mail.gmail.com>
References: <ea182b20901270724r3c7909dbo7ddec6bc92c8afa6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=aNUHeErsTHB07W0pfDtPiqBxVPdlhZgs2ASt+sp/PG0=;
        b=JpXCBcGvIt1bdZX+sTdX1DNuAfilEmriyutgVQ0jN67Y/zzAppevEWLz3+3nn7eZsw
         H+UO7IoPgvoraDDdjZ/XNmkQAM/VNVlGcUdxqMy9yNA6fJQh1zJE3MUoTha3Nc7jcYMW
         rw7ULuAc4WuFys7Y+1DXB7JjqloQbi9OQKgNY=
In-Reply-To: <ea182b20901270724r3c7909dbo7ddec6bc92c8afa6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone!

I wanted to filter out the annoying logs:

Jan 24 00:19:54 tetra kernel: martian destination 0.0.0.0 from 1.2.3.4, dev eth0

and issued the following:

#iptables -t raw -I PREROUTING -s 1.2.3.4 -d 0.0.0.0 -j DROP
#iptables -t raw -I PREROUTING -s 1.2.3.4 -j DROP

Amazingly, I'm still getting those pesky log messages. How is this possible?

# uname -a
Linux xxx.xxx.xxx.EDU 2.6.28 #1 SMP PREEMPT Fri Jan 16 00:41:03 EST
2009 i686 GNU/Linux

Thanks in advance for any of your ideas.

Best,
Yury

PS. Please CC me, I'm not on the list.
