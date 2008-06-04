From: john@langherd.com
Subject: Re:  Difficulty with iptables script to only allow 3 ports across 
    the  firewall
Date: Wed, 04 Jun 2008 14:38:00 +0000
Message-ID: <W901418390205751212590280@webmail23>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Glenn Henshaw <thraxisp@logicaloutcome.ca>

-----Original Message-----
From: Glenn Henshaw [mailto:thraxisp@logicaloutcome.ca]
Sent: Tuesday, June 3, 2008 11:03 PM
To: john@langherd.com
Cc: netfilter@vger.kernel.org
Subject: Re: Difficulty with iptables script to only allow 3 ports across the firewall

" try adding $IPT --policy FORWARD DROP this will drop any packets not explicitly listed "

This worked perfectly.  Thanks a million.

John




