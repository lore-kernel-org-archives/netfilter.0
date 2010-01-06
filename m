From: John Haxby <john.haxby@oracle.com>
Subject: Re: iptables for bandwidth tracking
Date: Wed, 06 Jan 2010 12:13:02 +0000
Message-ID: <4B447E4E.2060505@oracle.com>
References: <4B44078D.4000103@twentyten.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B44078D.4000103@twentyten.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Nguyen <iptables@twentyten.org>
Cc: netfilter@vger.kernel.org

On 06/01/10 03:46, Michael Nguyen wrote:
>
> - Using one of the many libpcap daemons to monitor and record traffic 
> patterns
> - Use iptables
>
> Each VPN node has the possibility of 64,000 IP addresses so if I used 
> iptables, I'd need to create iptables rules for each of those IP 
> addresses.  That seems silly to me, but am I better off doing that 
> than running a daemon that at the end of the day will basically do the 
> same thing?  Thanks in advance.

Are those 64K addresses all in one subnet?   Then something like

     iptables -A FORWARD -s 10.0.0.0/16 -j node1
     iptables -A FORWARD -d 10.0.0.0/16 -j node1
     iptables -A FORWARD -s 10.1.0.0/16 -j node2
     ... and so on

Then you can just collect the stats as and when you feel the need.

The advantage of that is that it's very easy to do and has very little 
performance impact (I believe).

On the other hand, the various libpcap daemons that I came across when I 
was looking for something for home might be better suited to what you're 
after.

jch
