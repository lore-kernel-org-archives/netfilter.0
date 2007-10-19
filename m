From: Tiaan Wessels <tiaan@netsys.co.za>
Subject: Packet duplication
Date: Fri, 19 Oct 2007 06:19:25 +0000
Message-ID: <47184C6D.40202@netsys.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
Not sure there is any life on this list but in case someone picks me up 
on netfilter user SETI here goes:
How do I go about duplicating a UDP packet arriving at a machine. 
Essentially I want to have it go to its original recipient but to 
another new one also.
-j ROUTE --tee seems not to be supported anymore.
Thanks
