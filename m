From: Art Reisman <astormchaser2002@yahoo.com>
Subject: Can I ? eth0 --> kernel-->User Space ---->Kernel--> Eth1
Date: Thu, 30 May 2002 13:50:44 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020530205044.5139.qmail@web10406.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Before I beat my head too much I was wondering in this

great world of iptables if it is possible to take
packets up into user space look at them, and push them
back out the other ethernet port ( essentially like
they never left the wire). I can see many examples of
forwarding, and I can read packets into user space;
but have not seen or read about anything
that has packets make a stopover in user space and
then back into the kernel subsequently get forwarded.


Intuition tells me this should work just fine because
the kernel after getting the packet back will move on
to the next rule.

Thanks

Art


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

