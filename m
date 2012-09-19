From: "me" <todh@todhackett.com>
Subject: connlimit troubles and questions
Date: Wed, 19 Sep 2012 12:16:04 -0700
Message-ID: <20120919185526.M10579@todhackett.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all

Curious about this, but first:

iptables v1.4.15
linux 2.6.30.10-105.2.23 ( fc11 )

I have: 
-A FORWARD -p tcp --syn --dport 4800 -m connlimit --connlimit-above 1 -j LOG 
-A FORWARD -p tcp --syn --dport 4800 -m connlimit --connlimit-above 1 -j REJECT
--reject-with tcp-reset

I see some connections limited, but not all.  I can look at the end point application to
view the inbound connections.

The end point application - users first connect on tcp port 4800, of which the
application then gives out an udp port number for data.

I haven't been able to find out how long those first tcp connections stay around. Are
they timing out, hence the second connection, or is the udp stuff what is causing me
grief?  

If they are timing out, how can I keep limiting connections?  

I have a range of udp ports that are given out, can I use those somehow?

Thanks!

todh

--
Todd Hackett             Chief Bottle Washer
PoBox 1168
Libby, MT 59923
406.293.3843

