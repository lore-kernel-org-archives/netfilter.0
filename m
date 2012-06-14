From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Capturing a C Class range dynamically into an ipset table within
	iptables. Possible?&#8207;
Date: Thu, 14 Jun 2012 16:34:44 -0600
Message-ID: <20120614163444.7wwufjwdc0ok4osc@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Currently with ipset iam able to send to a table the inidivual (/32)  
source IP of a connection...

I need a way to send to iptables the C Class to an ipset .

In other words I need the historical list of last 30 min of C class  
ranges that have requested my server.

I need this preferably done without something outside of iptables  
(such as a daemon).

