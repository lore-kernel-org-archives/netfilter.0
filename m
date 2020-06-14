From: paulo bruck <paulobruck1@gmail.com>
Subject: loadbalance 2 internet links
Date: Sun, 14 Jun 2020 16:02:55 -0300
Message-ID: <CANSGRxRvwj59r=Q-XZJBfugLJTLo9L6Sciiou+y=6uP_Cet=+Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7xUsnfENNSfEGLKHC101fHMJdXw/Q2t6l6z7LE/sZyg=;
        b=G2hvBIcN+6FiyPBoRtHhVMQGUQt3WBj8FqVu2Zb8svxxucJveCXrzuQ9GmvxJG7Xvp
         Hdmfny54Fvf+SJaGfvWB6aUUNw+ZdA0Sgpu5v/4HJ856F6n+5rrRxsx4BEnDJ4cX3qHY
         CIzpKel2HbwFrmGAIftaspCXqEtZiEDAafC+y1a51NuPHCHgOePg8wth6KhRw2ODyhta
         oWCB9mE+PS8cepufUyEvR2/Z7R1xBRVwMY30dX/8d4xfDaLY+zP9w5nHwW1Z+kJAUM5D
         PshQLpa4lsPjmzLOh4B/w3+BNSFdp1m/LRHrvPmBJu7CnePTxpcbbTLgqteTKh6G8NFq
         vTiQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi everyone.

I am  writing the last part of my scripts to use nftables instead of iptables.

Last tasking is part of load balance between 2 internet links.

I have read this paper about load balance. ( thanks Laura 80)  )
https://netdevconf.info/1.1/proceedings/papers/Load-balancing-with-nftables.pdf

and those for conntrack
https://superuser.com/questions/1277697/making-routing-decisions-based-on-uid-using-nftables

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_metainformation

If I have this situation:
              |-------------| ------wan1 ------
----lan----| Firewall  |
               |------------|-------wan2 -------

I believe that I'll have to use iproute2 + nftables + mangle + ctmark
for lan packages and applications that reside in firewall because I
cant brake connections between lan and internet ( suppose that at lan
I have an user accessing home bank ( port 443/tcp) . In this situation
I must consider all traffic from this connection to in/out for the
same link. Am I correct?

thanks for your time

best regards
