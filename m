From: Michael Nguyen <iptables@twentyten.org>
Subject: iptables for bandwidth tracking
Date: Tue, 05 Jan 2010 19:46:21 -0800
Message-ID: <4B44078D.4000103@twentyten.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hey guys,

Our servers are in a managed hosting solution where we do not have 
access to our switch.  We have a lot of users that use our VPN solution 
and I'd like to better track their bandwidth usage.  I'm considering two 
options for this:

 - Using one of the many libpcap daemons to monitor and record traffic 
patterns
 - Use iptables

Each VPN node has the possibility of 64,000 IP addresses so if I used 
iptables, I'd need to create iptables rules for each of those IP 
addresses.  That seems silly to me, but am I better off doing that than 
running a daemon that at the end of the day will basically do the same 
thing?  Thanks in advance.


Michael
