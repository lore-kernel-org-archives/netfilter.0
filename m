From: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Subject: Re: nflog : We are losing events. Increasing buffer size to 1736704
Date: Wed, 16 Sep 2015 13:48:21 +0900
Message-ID: <20150916044821.GA29321@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=CWzh1zKBbqAADQA4yQwLgl26p9rPDXQbipP4Boj504U=;
        b=mjP7y12lq74yY4iuI5zMcCtLUS4AAUWQI3Mhj3W2OV4eMHPMlF4BQ9J6v7QpW1mOuw
         s7zLZ0HVMvApFzpDrz/h0vYxFuuq7GNk+BSeTYlDuNklEjrOaDQPcBlzea9pLFXyNFEs
         NJC48HS/lfP8L6/lDJk60pw0Yj0K2ap04oZY5r75yRFL8p/RXgnY8FBC8vfMPEm4MtAY
         aEZYqSvZXiZ61HaAUgCBpzchL9f4SqHQ0eUhytwz1TXXm2QA9rGbv0oOctzXXsG19qU0
         GLDLlHFJILLAwacXnUpmM+U6+X19g4Kw67iEYeRZa156CphR1BUcCK7F+kcDmVUEs5ut
         WQhw==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: netfilter@vger.kernel.org

 Hi,
 
On Wed, Sep 9, 2015 at 6:54 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> It doesnt get increased more than 1736704.
> Even if I set 1736704 as the default buffer size, then also I get the
> same message
> We are losing events. Increasing buffer size to 1736704
>
> Why is that so? What makes the buffer size having ceiling at 1736704
> (= 212KBytes)

It would be better to show your ulogd.conf, someone might be able to
help you more easily. I guess... set netlink_socket_buffer_maxsize
in ulogd.conf adequately and also check /proc/sys/net/core/rmem_max.

Thanks,
