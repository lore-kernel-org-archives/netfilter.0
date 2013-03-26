From: Rodrigo Salazar <rodrodsalazar@gmail.com>
Subject: libnetfilter_queue not picking up any packets during recv step.
Date: Tue, 26 Mar 2013 16:32:36 -0700
Message-ID: <CAPgMsH3poJJ4w0ub+03i3OmTyK7Q+WYM+QPpix5a248eDYZg0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
         :subject:from:to:content-type;
        bh=DnmghRWUr/io6sGOc4B9fN0hx3j291DI+wWHP/5c9jo=;
        b=G08tIQPobeGY90BiIdetcKsL7T/lZZkJU6Ps6G+A79weB3XlPWwvAUMi3vmrunOOA8
         HdW/nOHj7cNVrCI1sfL10ykb+0j4UZ2EjtNqYMlceQ2jmyBwsjz81tZVIXXjhy+HC/JD
         MfZ5j0sZroQtrAl1p9hleYQVF1Wqxv6heZPj7Fw6fSjuQK1+aNdAXEoIYyD1sTBYZlFu
         wnFy8J21okhF5dxXe07VkjUqU2yJc+iRvBClur9txBF9tjqRqpQVtODvwvWq/Qcx86o1
         VD+AocXEXmQjYj+WBzDJXCnj/coXu0WIgEK9W67aLEHsfaEJHWqV/csbfAsS3Qzk6Po4
         zhYg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thanks in advance for your help,

I am running the demo test code (with queue num 100) nfqnl_test.c
which is found in the documentation.
http://www.netfilter.org/projects/libnetfilter_queue/doxygen/nfqnl__test_8c_source.html

I have added the following rules to my iptables:
sudo iptables -A OUTPUT ! --out-interface lo -p tcp --syn -j NFQUEUE
--queue-bypass --queue-num 100
sudo iptables -A OUTPUT ! --out-interface lo -p tcp --syn -j LOG --log-level 7

There are many packets arriving at the LOG. But none ever arrive to
NFQUEUE on the userspace side. recv(fd, buf, sizeof(buf), 0) just
hangs waiting for the message from the kernel.
The binding and creation of the queue seems to have gone fine, no
errors were thrown before reaching this call. I am also running my
program as root. My output of `lsmod`: http://pastebin.com/m3gBKVst

Any tips to debug this are appreciated!

Thanks,
-- Rod Salazar
