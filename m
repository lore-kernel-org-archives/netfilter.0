From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Loopback security...
Date: Mon, 21 Apr 2008 21:05:42 -0500
Message-ID: <480D47F6.9080808@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

It is my (mis)understanding that the Linux kernel treats the loopback 
interface and / or the 127.0.0.1/8 subnet as (in a word) "sacred" and as 
such secures it.  I believe I understand the mentality of this and do 
not have a problem with it.  However after helping someone work around 
this problem (via rinetd) I find my self asking wondering is it possible 
to disable this security on the loopback interface.  Is there a /proc 
and / or sys control entry that can be throbbed to allow traffic in to 
and / or out of the loopback interface?



Grant. . . .
