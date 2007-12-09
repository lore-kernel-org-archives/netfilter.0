From: Deephay <tudoxxx@gmail.com>
Subject: how to do a MAC-based filtering for NAT
Date: Sun, 9 Dec 2007 13:11:05 +0800
Message-ID: <9a9df61d0712082111s90a5fa3o4d272b2c1dacc1f1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=6AdA0/138I/aCTWr7Q8w8643Nny7gyppinrf49eXa1U=;
        b=i3YMv16pzFL68FWDJmd7sRWwfDJDFi4GmL0Vcf/pZFo72+WR8R4c+FvYEg4O4ng3eputj/nAEd95/ONrK6qK6FdG0/HarCDhV+wXtFUZMg9x8P8VJGFkQR9xtCM287mfmwVDhUmcZpA4k86kHqPhMyjH1ivxRd9d4FICrmaaCP0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings all,

I am wondering how to do a MAC-based filtering for a NAT:

iptables -P FORWARD DROP
iptables -A FORWARD -m mac --mac-source xxxxxxxx -j ACCEPT

the above things will not work, is there a way to achieve this? thanks!

Cheers,
Deephay
