From: Lawrence Lee <lawrenceqli@gmail.com>
Subject: If the hooked SYN packets return with NS_STOLEN, TCP cannot
 successfully establish the connection
Date: Tue, 16 Apr 2013 16:52:18 +0200
Message-ID: <CAGXkBO_x2jKXfSPvETcH3bi9Rsx_JEG8X5nTPF1Vghv+HavQ2g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=CiQMALb4YgQI7v/JzQTyQOJHuQi7ugAQ/jyB7Yf/qzI=;
        b=EoC8AvTwY78bgrBhzwhrJidjC7ri7vaKr1xp1+VJZU7FXGhp+bmMsDrDqtOTVrs5ez
         iwMUjPnsJdYu7UunJgXhgXcmLD/ejmhQ02yqGV96+Gx5cz4sUpRgyrCYd+ss2crr18+O
         l0+uNZqW62IUByeFZQV1NpyxQ6DNb682cx1eI2Yz2AUzPwD+Attvv+aKlzNOwDQozg3L
         SCHRoPiTOUTauOjD+CKGJpLEu2HY31/i/VWpkjgxgdJrkW0WHITSJ8mA8ZHZjKBAbUM3
         cWQdEN1h1PVtM9cg9kuyGyaqexzC6NVTtmI2YuZ4qMc2cSwwHvkiUeoOZOYVvVgGk7a/
         +6Zg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

In NF_IP_LOCAL_OUT, I hooked the TCP SYN packets and directly sent out
by dev_queue_xmit, and return with NS_STOLEN. The packets can be
successfully sent out, and the peer replies with SYN+ACK.
Unfortunately, the local host does not accept the packet but replies
with ICMP error information, i.e., destination unreachable (host
administratively prohibited.

Actually, it is the same case if UDP request packets are hooked in the
NF_IP_LCOAL_OUT hook and are return with NS_STOLEN. The UDP response
packets will be dropped with an ICMP error packet.

I look into the source code. It seems that in the ip_local_deliver()
function, return NF_HOOK(PF_INET, NF_INET_LOCAL_IN, skb, skb->dev,
NULL, ip_local_deliver_finish) does not get in
ip_local_deliver_finish(), but call the icmp_send() function to send
an destination unreachable message.

May I know what is up and how to fix this issue? Thank you very much!

Best Regards,
Lawrence
