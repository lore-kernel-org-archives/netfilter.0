From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: NAT and listen on random ports
Date: Fri, 19 Dec 2014 12:46:24 -0800
Message-ID: <CALPbv1-PYS25HSkMvCD_otVVd0iPpN9jBL+D2dh6GQCRJDeObA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=g5z8fEwOlxso1rMTzMwv5ABkDYeIPk+Afa3qVjhCwTI=;
        b=sqJ8/PsbVasN58snY1joXVdmz7NFaOAjJH3Uwl6spLeZtnbeRavhPFhQWlz5YxaYsk
         lAI+w3YdC3WCcPmhrR1IWqNWR+1WF70eP+iyTK9ZggR9n11etJ31/1CDSbylJgA6FBxT
         MSZafs+zfeHpQzS9CWCY0XCKRgezl4ztpSbuWb+eVYz2ERhKh1tY9DUZ/Rtm9I50dwCJ
         0q3sbVpf0b6eiv6x36avqxs4qibLWvg6cKoj6RfXSw/rPF+Zng3BGX4mzbQce6iRWjll
         rI6r0WW3Q40tfZPSdE6zEDkwu+t1dOTSo9MpYEr4TlYbZZC2VLmnSGqqvR23SnJCPlW9
         6Dgg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

With MASQUERADE & DNAT
Iam able to run servers on veth and be able to access network.

e.g., for SNMPD on veth3 ( 192.168.10.3 ) I do this on the host
-A POSTROUTING -s 192.168.10.0/24 -j MASQUERADE
-A PREROUTING -p udp -m state --state NEW,ESTABLISHED --dport 161 -j
DNAT --to 192.168.10.3:161

Lot of protocols go out on random ports and listen on the same source port .
How do I achieve network access for protocols that goes out on random
ports and listen on random ports ?
Do I need to add the PREROUTING rule on the host before I
socket:listen, so the traffic gets forwarded to the right veth ?

Thanks.
VIjay.
