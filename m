From: Steven Stromer <filter@stevenstromer.com>
Subject: Rate-limiting based on data_throughput/time
Date: Mon, 18 Aug 2008 14:45:15 -0400
Message-ID: <B1ECFB2B-9779-4732-9D7B-209ECE215E76@stevenstromer.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@vger.kernel.org

I want to rate limit queries to protect from Polyakov styled attack:
http://www.nytimes.com/2008/08/09/technology/09flaw.html? 
_r=1&partner=rssnyt&emc=rss&oref=slogin

ISC's Paul Vixie recommends limiting to 10Mbits/sec to mitigate this  
attack vector, but I can't find anything on iptables rate limiting  
based on bits, bytes, or Mb / time (as opposed to packets/time).  
Assuming that the size of any single UDP packet in a query can  
change, up to the limit where it is refused in exchange for a tcp  
packet, I can't even see how the correct packets/time could be  
accurately inferred. Any recommendations?

Thanks!
Steven Stromer
