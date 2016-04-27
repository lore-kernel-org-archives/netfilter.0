From: Satish Patel <satish.txt@gmail.com>
Subject: Build firewall with millions pps support
Date: Tue, 26 Apr 2016 23:20:00 -0400
Message-ID: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=8IvQSibHu8bl9hwUrt+LemydXT1QrfXws8fKTG+9ORo=;
        b=JnzOLvWT5xr0CGvJNt0RPjzvXX1faaft78dlN3SlmNpZeNz7Gb7FplDbc7j4Wx1fhM
         hm0Ne+Xg88DLyfTMi6LWieV488dRJhf5NVcz/7vwG7KqBBB7xWei6a9ijm8QwuBAVN82
         7gpo7tbe0t8Vrdvt9u+PTf3bH9GweEMfIWxJGdnZ9S5y8It89Hp40mdt7Dl2i9aEecPs
         5/d2S6NXaztpeI+OJWvcY8vjVquaktfGjCBSQHhsd5vhBHrX4zdwW5xKzX7TY0+qSnAV
         o4nzoDpOcy5ITyEolBaKmrYjrCMbHQXsOdasgkqMwtRzU7ODnHZYuDE+jsO22hmDlCPO
         9gwg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Planning to build stateless firewall which support 10GE link with
handling 2 million packet per second, need following suggestion from
folks

1. Which OS i should use?  (BSD or Linux?)
2. what type of 10GE NIC i should pick to achieve high Mpps (multiqueue etc.)
3. what should i use for bypass kernel (I heard from googling people
saying use this technique).
4. what kind of server i should pick?

We are build this firewall to stop bad traffic at front door and DDoS
(specially flooding and UDP IP Fragmentation stype)
