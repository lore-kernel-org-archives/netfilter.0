From: Satish Patel <satish.txt@gmail.com>
Subject: Can iptables handle 10G link traffic?
Date: Fri, 18 Dec 2015 12:48:07 -0500
Message-ID: <CAPgF-fqB8=ekCnZv39qvmgjHjvkXtiCGua0PHVO_19s5YgNRWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=1AOiUqv3HfPXoVm/z6ucY9hhMrG7yOBjQAyTbU0WKxM=;
        b=M0zKPjqjUQeFN5Y3+UyQCKTOtPdqovaMTawh04Y4l3B1wIq2KT5igwO56yqSUk8Wej
         r+TKmHFzOx4ZNgsZZPl/nvl9bjvnoEJ43Uq+Q7XTwUFsGRxomz/fQXwVhQiLijdIDWVh
         FtLbOT/Bf2ajqUZZeS7wObfvWYE4onEZQJV7zQkKBSzShF9Y2uptYcA5sXCSn7xIZIm4
         BSa1d1HENMQSRKmmY5sC7ZZ1FHt/0KEP4N9JPKEJJQySJ0QqYVfBs3jbD3ThqbAg0wEV
         gtqHtUcK19zOPOFyvgJeqQO7Zu0EB8z69U+Bkc8ECHmmoZbSrtRt5BLNxRT7jAZIfYBQ
         BgjQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We are planning to implement Linux base firewall to trash unwanted
traffic. We have 10G link, can iptables handle 10G link traffic?

If yes then

1. what kins of hardware it require?
2. how much Memory it need?
3. Any kind of special Linux flavor?
4. specific NIC?

Please suggestions are welcome.
