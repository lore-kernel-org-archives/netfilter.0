From: Patrick PIGNOL <patrick.pignol@gmail.com>
Subject: User Firewall
Date: Thu, 19 Jan 2017 05:31:15 +0100
Message-ID: <86185443-8840-2736-bffd-7e869be41997@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=cfc3zIRK0G/kce86l8YyfbaAi/3lsxNzHU7Ech0cAIo=;
        b=QeLETW2rUs6mMagh9kTAql3s3xAXR3n9U4FzpvM/3BpTbGcVVtN5mtlY6KPQ3msV2M
         KM5SfthVgkFQA6jZFvKrRAGsm2diYbO0BTXKl6hEtLcFTxxNIfR3iOUfYEtGuoyUIR3z
         yLI/xQf4VlR6tE9hMiespiG1d1xJXRZxXR/YYerc0hCdw68j1VatSeMnDHHd4wRvMOpV
         C4qtHUp3czZ9D6xCtaJ8LOQ6AmRiR1IROyTdb+f+rief30WF1BVNp3D+Cb2y9O3Jai+Z
         zaj33MLjEhN4tSqdT2Sc/x6cnClJyJz7wVjitHQQJ1RMaw+FFz2Ew1i3qRiioPdXmMxb
         klYA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Good day all,

First please don't blame my poor English, I'm French and I'm not fluent.

I don't know if this is the good Mailing-List for that ... so please 
redirect me as necessary ...

But I would like to write a linux firewall user software like Zone-Alarm 
on windows, able to warn user that a given software(even system one, via 
socket or not) want access to the web on a given 
way(INPUT[/FORWARD[/NAT]]/OUTPUT), on a given 
protocol(ARP/ICMP/IP/TCP/UDP included) and on given port(s) to let the 
user choose what to do with that packet and maybe create automated rule 
for that kind of packet.

I heard about NF_QUEUE API and finally found this sample code on the web :

http://netfilter.org/projects/libnetfilter_queue/doxygen/nfqnl__test_8c_source.html

I have been modified the code line 91 :

<code>

printf("unbinding existing nf_queue handler for AF_INET (if any)\n");

if (nfq_unbind_pf(h, AF_INET) < 0)

{

     fprintf(stderr, "error during nfq_unbind_pf()\n");

     exit(1);

}

printf("binding nfnetlink_queue as nf_queue handler for AF_INET\n");

if (nfq_bind_pf(h, AF_INET) < 0)

{

     fprintf(stderr, "error during nfq_bind_pf()\n");

     exit(1);

}

</code>

by :

<code>

printf("unbinding existing nf_queue handler for AF_INET (if any) ... ");

nfq_unbind_pf(h, AF_INET);

printf("done\n");

printf("binding nfnetlink_queue as nf_queue handler for AF_INET ... ");

nfq_bind_pf(h, AF_INET);

printf("done\n");

</code>

because of, as I have been understood, there was a retro-compatibility 
issue that return non-positive values.

I have been compiled it with :

 >$ gcc -Wall -o test nfqnl_test.c -lnfnetlink -lnetfilter_queue

Cha ching ! That done !

I written a firewall script with (at end of file) :

<shell>

 ># iptables -A OUTPUT -p ALL -j NFQUEUE –queue-num 0

 ># iptables -A INPUT -p ALL -j NFQUEUE –queue-num 0

</shell>

that give me something like:

<shell>

 ># iptables -L -n -v --line-numbers

Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out source               
destination
...
7        0     0 NFQUEUE    all  --  *      * 0.0.0.0/0            
0.0.0.0/0            NFQUEUE num 0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out source               
destination

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out source               
destination
...
16       0     0 NFQUEUE    all  --  *      * 0.0.0.0/0            
0.0.0.0/0            NFQUEUE num 0

</shell>

So I think it is well registered by Netfilter

When I launch The test code, it output :

<shell>

opening library handle
unbinding existing nf_queue handler for AF_INET (if any) ... done
binding nfnetlink_queue as nf_queue handler for AF_INET ... done
binding this socket to queue '0'
error during nfq_create_queue()

</shell>

In fact :

<code>

qh = nfq_create_queue(h,  0, &cb, NULL); // qh == 0

</code>

So I'm blocked on Queue creation and can't move forward because I don't 
know what doesn't work at all.

I'm on UBUNTU (lastest, not LTS) (I know, it's not a good word, but not 
worst as "Windows").

My question is : Have you any hint (or links) on/for that issue ?

By advance, thank you.

Best regards

Patrick.

