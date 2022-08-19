From: Julien Moutinho <julm+netfilter@sourcephile.fr>
Subject: Raw payload matching beyond 2040 bits
Date: Fri, 19 Aug 2022 12:07:38 +0200
Message-ID: <20220819100738.63yvp7iggoilt2uc@sourcephile.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sourcephile.fr;
        s=20200101; t=1660903659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=aB8x3Mifp8AJOtyyw2HLHtT9qjOHA9P1bt7uQK0a9d4=;
        b=g5+MCuEmVgxZW+xlAez5GF7dg1LLbKg4gJbjWusLwYUbkafCMcoTKTI1PsLGh6qsSvymeM
        XApS68YYpRfWyA9ZGVyUlCeV7jrPbyIHgnlyrImOGzwNFDbIzxzIoxJruqaz2DXEw9LQc9
        zB6tZ9g1eslPprJbJFQ6IIwNQkFvQIBsGK7S9+YndIqDTYKAZMakkNXL7QN+Bhke1521Wg
        +zDxnAjveBTe8GKou2xYX+Te4PB/+Sesr0O5BdjH/5L243eTzDw3/nxUD8mWudhxH7pqE6
        d8aBZ62+FURuxBWnogyjjM9T4dUzT/y2fxu3whvnLR4SxOd0tT/RvAUQm26ua9Iqzvkgfi
        qjYIgg8tD2R+84ZI0vC0FyZ+mbu7e1r4Vq7GyS//ANu7tLjOGTlLx8xVb+T2lqsh/h331v
        MVbngr+FiCG++pWQ+vi2bqCX/ODnaXrkOtmbrtNp7gmnN1Ont9uBl5Ztjq0XdzrK2Kkcpq
        GytsOaOds4dZ6pPDqnnfcC 
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Dominique Martinet <asmadeus@codewreck.org>

Hi netfilter@,

Apparently matching beyond 2040 bits (255 bytes) starts again at 0 or something like that.
Not sure whether this is intended or not,
but in this case a warning would be appreciated.

Thanks for your work,
Julien

# nft add rule inet nat prerouting udp dport 4242 @th,2040,128 0x12345678912345678912345678912345 log

# nft add rule inet nat prerouting udp dport 4242 @th,2048,128 0x12345678912345678912345678912345 log

# nft list ruleset | grep 4242
udp dport 4242 @th,2040,128 0x12345678912345678912345678912345 log
udp dport 4242 udp sport 4660 udp dport 22136 udp length 37155 udp checksum 17767 @th,64,64 0x8912345678912345 log
