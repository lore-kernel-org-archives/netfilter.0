From: Khanh Tran <khanh@slc.edu>
Subject: RE: iptables grep problems
Date: Mon, 3 Feb 2003 08:34:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC64EB7B@EXCHANGE>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'saint' <nagajuna@optushome.com.au>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Are you trying to assign your external interface's IP to a variable for
something?  What does $2 look like?  Chances are you are trying to do
something with $2 as an IP, but really the value is probably set for
"addr:1.2.3.4".  You may also want to add a #!/bin/bash, or whatever your
shell is to the top of the script if you are getting the right variable
assignment.

Khanh Tran
Network Operations
Sarah Lawrence College

-----Original Message-----
From: saint [mailto:nagajuna@optushome.com.au]
Sent: Monday, February 03, 2003 8:14 AM
To: Netfilter Mailing List
Subject: iptables grep problems


Hi all,

It seems I'm in a bit of a bother.  Here's my problem:
I have a semi-permanent IP address provided by my ISP
and I can't do one of two things:
1. use eth0, and
2. use a combination of grep, awk, & ifconfig.

Normally, if I issue this from the bash shell:

$ifconfig eth0 | grep 'inet addr' | awk '{print $2}'

I get the intended result i.e the external interface's IP address.
So why can't I get anything when I put this in the firewall script?
Actually, I do get something: ERRORS!

If someone would kindly help me with this problem
and relieve my suffering it'll be very much appreciated.

Thanks.

Santos.
Still learning.




