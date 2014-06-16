From: "Cade Robinson" <cade.robinson@gmail.com>
Subject: RE: Default netfilter kernel buffer size?
Date: Mon, 16 Jun 2014 08:28:55 -0500
Message-ID: <01e601cf8966$ed0b6450$c7222cf0$@gmail.com>
References: <007501cf8685$69b9a460$3d2ced20$@gmail.com> <20140616093502.GA8007@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-type:content-transfer-encoding:thread-index
         :content-language;
        bh=fX9sLEPGzCR5gMbFVjtUlIXDmeB4WR/UeSyi1P2CYVI=;
        b=RzilnmKbe9vPcUJicVNUOIXnB9VKTwLRNHMT/WzYieyuycCJ+XxdFT/rvRqXAL09fx
         x8VbJqAFw2tVbhgF8eXSJyD/UJYwS95K84+tRzXdUYe8wEL51lZzCmnnihnEAblld7Nx
         I1Iz8WY0kqfjhqn5u8YyJrGK47ZJ6SqpanlUrm9ML5V5zZCXE3zyCyHFUL6K5qo+OOXo
         C7Sxd1tzRmsC/XIarDy8JdmHBtLWbf8DOLy1JNG+6yCaScI3rE187QnH2mlujbpKsnhk
         53V+l1n0kFU53B0Mo4QoNKHdVZlUpbWYoegGvIvTV09wMSKu9rc6SQyGpMSI9rox0VxC
         WrZw==
In-Reply-To: <20140616093502.GA8007@localhost>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Pablo Neira Ayuso' <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> Please, have a look at the documentation:

> http://www.netfilter.org/projects/libnetfilter_queue/doxygen/

> It refers to this problem.

Thanks - that gives me more ideas of what to do if my current fix doesn't
work.
What I have done is added code to set queue length using
nfq_set_queue_maxlen.
This seems to have worked as well so far.

But what I am looking for and can't find is what is the default queue length
and is there a /proc file that shows the current length?

