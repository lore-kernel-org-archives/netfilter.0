From: "Dennis J." <dennisml@conversis.de>
Subject: Excluding IP from connection tracking
Date: Fri, 29 May 2009 12:04:59 +0200
Message-ID: <4A1FB34B.8060902@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
Is there a way to exclude destination IPs from connection tracking? Right 
now if I enable connection tracking in general on our router after about 30 
seconds the connection table fills up. 99% of the traffic is hitting a 
specific IP and I would like to keep the connection tracking itself 
available for everything else but disable it for that IP only so the 
connection table stops getting filled up.

Regards,
   Dennis
