From: David J Craigon <david@craigon.co.uk>
Subject: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 14:32:12 +0000
Message-ID: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=m67qp43HO/yq/Tf7d6/nV9uwqaushw2MzBfe2XggipA=;
        b=LFUwW6SpilhCG9RCpra9+/cAfnYtIaAwH1SeBKdg0EyVLE5tDwDr1p9QdRMwpypHk2
         JNyQTAVmPZ56RPw5fDcwqioFxXWaHyTreBHisKLrDkqPcnEU3No69iSSPWz+DGN7BlWv
         s74EXeVBrDhJy/ukPoWqGrIkLoBbyradvnca8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm trying to build a firewall using Linux, iptables and conntrack. My
set up is pretty simple- I've got a computer with three interfaces-
one pointing to the internet, and two networks for different
"customers".


Internet--------Firewall------Customer 1
                           |
                           ----------Customer 5



Customer 1 has 10.72.2.0/24. Customer 5 has 10.72.3.0/24. Both
customers have a server 10.72.2/3.3 running httpd on port 80.

Now, both Customer servers can get to the internet, and the internet
can get to them, but Customer 1's server can't get to Customer 5's
server.

Here is my iptables -L:

[root@e1 ~]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
RH-Firewall-1-INPUT  all  --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
Network-1  all  --  anywhere             10.72.2.0/24
Network-5  all  --  anywhere             10.72.3.0/24

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain Network-1 (1 references)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere            icmp any
ACCEPT     tcp  --  anywhere             10.72.2.3           state NEW
tcp dpt:http
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
REJECT     all  --  anywhere             anywhere
reject-with icmp-host-prohibited

Chain Network-5 (1 references)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere            icmp any
ACCEPT     tcp  --  anywhere             10.72.3.3           state NEW
tcp dpt:http
ACCEPT     tcp  --  anywhere             10.72.3.3           state NEW
tcp dpt:http
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
REJECT     all  --  anywhere             anywhere
reject-with icmp-host-prohibited

Chain RH-Firewall-1-INPUT (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     icmp --  anywhere             anywhere            icmp any
ACCEPT     esp  --  anywhere             anywhere
ACCEPT     ah   --  anywhere             anywhere
ACCEPT     udp  --  anywhere             224.0.0.251         udp dpt:mdns
ACCEPT     udp  --  anywhere             anywhere            udp dpt:router
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ipp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ipp
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere            state NEW
tcp dpt:ssh
REJECT     all  --  anywhere             anywhere
reject-with icmp-host-prohibited


As you can see, I've got a separate chain for each customer.  As you
can also see, I'm using the --state RELATED, ESTABLISHED feature using
conntrack.

When packets go from each server to the internet, a line appears
correctly in /proc/net/ip_conntrack. Packets then get let back in.

When I try and get to the webpage on Customer 5 from Customer 1, the
HTTP connection SYN packet gets through to Customer 5, but the SYN+ACK
gets blocked on the way back, and the connection does not appear in
/proc/net/ip_conntrack. Any idea why?


NB. I'm trying all this out with virtual machines currently, but I
don't think that should affect things at all.

Thanks for any help,

David
