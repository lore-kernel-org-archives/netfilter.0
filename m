From: Elison Niven <elison.niven@gmail.com>
Subject: table full, dropping packets when forwarding
Date: Wed, 23 Dec 2009 11:48:32 +0530
Message-ID: <21df6cb70912222218x1effa9ednee786e6c5b1bc70f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=4M7FjOO6Sz/8droeAljY0g26F005t2P7ozvNSuNppKA=;
        b=VVOGeipUY7qF8i6EGbLIR2EP3TundAezymPuciBiFG2oX2YPAWgl2iZo3krzX2hHm8
         UA0ig3kSS6YCo7f07jMKD8+9cgorjinVdoAds3Gm3lMUp1V0MZGzLMaAlnZ6MjqUjERW
         YyHBebzF6iR/KIG7JKnmZ0co23eJA7pp94xZw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: elison.niven@matrixtelesol.com

Hi List,

I am running a custom powerpc board with linux kernel 2.6.22.
It was two interfaces eth0 - 192.168.1.148 and eth1 - 192.168.2.23

I have enabled forwarding on my board by writing 1 to
/proc/sys/net/ipv4/ip_forward and setup masquerading rules on both the
interfaces means packets leaving eth0 will have source ip =
192.168.1.148 and packets leaving eth1 will have source ip =
192.168.2.23.

Now in my network I have two machines A - 192.168.1.7 and another
Machine B - 192.168.2.13.

All of the above machines are in the same physical LAN. (means the
ethernet cables are connected to the same switch)

Now on machine A, I setup routing as
"route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.1.148"
and ping 192.168.2.13 from Machine A. When i do a flood ping with ping
-f 192.168.2.13, I get "nf_conntrack:table full, dropping packet" on
my board.

Taking a look at /proc/net/stat/nf_conntrack it shows the entries as
0x8000 i.e. 32768 which is the default max specified.

How do I solve/achieve this function?

Once the entries reach 0x8000, they never start to decrease! Am i
missing something ?

Elison
