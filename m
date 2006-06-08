From: New User <jfjm2002@yahoo.com>
Subject: Forward data from one interface to another with actually exit
	through one interface
Date: Wed, 7 Jun 2006 23:59:24 -0700 (PDT)
Message-ID: <20060608065924.74551.qmail@web38002.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

I have a machine with 2 network interfaces (A and B)
that are connected 
to 2 different ISPs. What I would like to do is to
have traffic that is 
sent from A -> B be directly sent there using
iptables, instead of 
having the traffic go through the Internet and come
back.

The application that I run requires me to bind to an
interface, 
therefore, the outgoing traffic to interface B has to
exit through interface 
A. Normal system routing does not take effect here.

Is there a way I can combine the OUTPUT and FORWARD to
just directly 
forward the packets to interface B if the source is A
and destination is 
B?

Thanks in advance.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

