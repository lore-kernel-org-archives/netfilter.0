From: Mistick Levi <gmistick@gmail.com>
Subject: TCP ack in libnetfilter_queue
Date: Thu, 23 Sep 2010 16:12:21 +0200
Message-ID: <AANLkTimxj_yVspgWQB2tHF+=ZGvEh1sdga+RdnD_t_SQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=cwccXIdMqty2nVW32QlTv0jctvIjIbuTotp5iTp8BCI=;
        b=x0PfmE6rqyMYi+88/avjU8148EFwOPfQWit8f1XOi84fy4hSkgPjq72Zc9GLlyzy32
         Js5jyDzlOZdtHiXggtL92LLLGJvr8yZYj6YNIYGILzYq5iICqJ/LXofX+xJoRIjynTbv
         NN0ZIdqkp1aAmdx0o61fIXpUVs+Zi8SR4yQN0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hey,

i wrote a filter using libnetfilter_queue api, and i want to send
messages to the queue in a specific way...
I want to get the first packet after the TCP 3-way-handshak is
finished ( meaning - only data!)..

i tried using conntrack with "ESTABLISHED" status, but then i start
getting messages to the queue from the last message of the
handshake... ( meaning the last ack )... and i dont want that since it
contain no data....

any help will be appreciated.. thanks.

Yechiel Levi
