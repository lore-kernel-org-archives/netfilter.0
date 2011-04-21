From: "Brian Lu" <lyt0112@gmail.com>
Subject: How can I get rules with all resolved IPs for FQDN?
Date: Thu, 21 Apr 2011 17:04:01 +0800
Message-ID: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi All
I am having a problem about not all FQDN can work for iptables commands .
If I run an iptable command for www.google.com , it can work fine.
I can find 6 rules from the rules table.
[root@localhost iptables-1.3.5]# nslookup www.google.com
Server:         168.95.1.1
Address:        168.95.1.1#53

Non-authoritative answer:
www.google.com  canonical name = www.l.google.com.
Name:   www.l.google.com
Address: 64.233.183.104
Name:   www.l.google.com
Address: 64.233.183.105
Name:   www.l.google.com
Address: 64.233.183.106
Name:   www.l.google.com
Address: 64.233.183.147
Name:   www.l.google.com
Address: 64.233.183.99
Name:   www.l.google.com
Address: 64.233.183.103

If I run an iptable command for www.facebook.com , it can't work fine.
I can only find a rule from the rules table. 

[root@localhost iptables-1.3.5]# nslookup www.facebook.com
Server:         168.95.1.1
Address:        168.95.1.1#53

Non-authoritative answer:
Name:   www.facebook.com
Address: 69.171.224.12

[root@localhost iptables-1.3.5]# nslookup www.facebook.com
Server:         168.95.1.1
Address:        168.95.1.1#53

Non-authoritative answer:
Name:   www.facebook.com
Address: 69.171.224.11

[root@localhost iptables-1.3.5]# nslookup www.facebook.com
Server:         168.95.1.1
Address:        168.95.1.1#53

Non-authoritative answer:
Name:   www.facebook.com
Address: 66.220.149.11

[root@localhost iptables-1.3.5]# nslookup www.facebook.com
Server:         168.95.1.1
Address:        168.95.1.1#53

Non-authoritative answer:
Name:   www.facebook.com
Address: 66.220.158.25

[root@localhost iptables-1.3.5]# nslookup www.facebook.com
Server:         168.95.1.1
Address:        168.95.1.1#53

Non-authoritative answer:
Name:   www.facebook.com
Address: 66.220.146.25

How can I get rules with all resolved IPs for this kind of FQDN?
Any suggestions will be appreciated!!! 

Best regards, 
Brian Lu
