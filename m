From: vinay mathew <vinaymathew80@yahoo.com>
Subject: Compiling sch_tbf.c in user space
Date: Wed, 16 Feb 2005 07:41:54 -0800 (PST)
Message-ID: <20050216154154.90209.qmail@web50403.mail.yahoo.com>
Mime-Version: 1.0
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: lartc@mailman.ds9a.nl

Hi,
I am new to kernel programming.
My task is to route packets from different hosts
through one single token bucket filter as we are
trying to model a wireless scenario with many hosts
communicating and sharing the same bandwidth.So the
idea we came up with was to route packets from
different hosts to user space using Netfilter and then
send them through a common tbf implemented in user
space in order to model a simple bandwidth shaping
scenario.
Routing packets to user space has been easy using the
Netfitler hooks and libipq.
My problem now is that i need to implement a tbf in
user space.I was thinking if its possible to modify
the sch_tbf.c code to make it work in user space so
that i can compile it as part of my user space program
that handles the packets sent to user space thro
netfilter.Ive tried modifying this code a bit but it
gives me a huge number of errors when i try to compile
it as a simple C program in user space.
If this is not possible does any one have a simple
basic implementation of the token bucket filter that i
can use in my program to test this scenario or any
other ideas on how to implement this tbf in user
space.
Thanx a million in advance.......and im sorry i didnt
know exactly where to post the query so thats why i
posted to both lists.
thanx and kind regards
vinay


	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail

