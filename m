From: Mike Wright <mike.wright@mailinator.com>
Subject: arptables question
Date: Mon, 06 Oct 2014 00:17:23 -0700
Message-ID: <54324203.9030806@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi all,

I'm trying to learn arptables.

Theoretical question:  a box has two interfaces, 172.16.100.1 and 
172.16.200.1.  I want each interface to ARP REPLY to ARP who has 
requests for all addresses in their /24 space.

Would this accomplish that?

-A FORWARD -j ACCEPT -d 172.16.100.0/24 --destination-mac 66:ec:27:90:78:00

-A FORWARD -j ACCEPT -d 172.16.200.0/24 --destination-mac 36:07:04:99:cd:09

If that's not any would somebody show me the correct rule?

Thanks for any help,
Mike Wright
