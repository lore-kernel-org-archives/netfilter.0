From: Tugrul Erdogan <h.tugrul.erdogan@gmail.com>
Subject: Bridged interfaces are not accepting arp replay packages
Date: Sun, 23 Aug 2015 10:22:52 +0300
Message-ID: <CA+whn7TW=E=+ozNN_-3Y-gRordrhRw0+69qvXr-LKc_=+Wpogw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=HZMkMQPIXRSQBeYynsk5m+uOsyo7OMd1bmBm6iEmVsM=;
        b=MuwG+Kh7py+NEAlBkqVxOCRsQv19fFbNyRBqFFhECGFNKMlxVqQtrcSaqXjuBclsUY
         6kW1IdrfqM6/GCtdLk9fntQtufxTphKf3Cz05WumPKyCms234mFkssogxxdULG2JBS6/
         oLcrhSAU1EqWPr8bkxLQGYjWmj15IjhbbnGNEyhXmnK2ZsZC4PazmHYvGXkXl9i7azKw
         iJHJLZvY0GecoQYZsyupURxYVMpsYhs12FKSbE+7AcK1QxdbnDwXLomqa2tc3z1x/HsW
         3H6ct+Te9d9q6BC8bK/iOE1rEpc9FOnBDcH0QsIUL52tvzZc5emR4zG3JfToxi7+bbvF
         JWOA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all;

I have a problem on bridged interface's arp replay management. My
bridged interface which name is br0 and its physical NICs has no ip
assigned them. I added the routing rule as follow "ip ro add A dev
br0" . When I try to use synproxy rule on iptables my device send an
arp request to A to determine the mac address of the A to create the
SYN+ACK package which will be sent to A. Then the arp replay of A came
back to my device, I can see the arp replay packets of A by tcpdump on
br0 interface.  But the arp table is not including this arp replay.

When I write some rules on arptables to analyze the arp request and
replay packages, I see that the arp request leaves from physical NIC
and but the replay of that arp request comes from br0 interface. So I
think that for this reason the arp replay is not taken on by arp table
as the mac address of A on my device (maybe as a arp spoofing
prevention method).

I want to take your helps. What can be the reason of this arp request
rejection. Is there any sysctl setting that I have not known yet or
how can I solve this problem?

Thanks for your helps.
Best regards,
Tugrul
