From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: URGENT : Probem with Redhat 7.1 incomfing  network services request
Date: Wed, 22 Jan 2003 10:17:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c2c229$65002070$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org





Hi,



We have installed Red hat 7.1 Linux one of our customer location. It used
work all network service (ftp, telnet, ssh) etc.  Because of power failure
file system got crashed, then we did fsck manually. Now system is booting
without any problem, it was able send outgoing request (telnet, ftp, ping).



From other machine only ping request work, all other network services are
not working. While booting the machine about 30 sec, It allows us to login
that after the it's terminating the telnet connection.



I did some google search, got the following message.



http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=UTF-8&th=5f887abf1be0e
4ca&rnum=14



We turned off the firewall, still its not working.





We did the following.



1



Ipchains -F



Tried telnet,ssh not working,



2



Chkconfig -level 12345 ipchains and rebooted the machine, then tried
telnet,ssh its not working.





Any Idea why it's not working? How will I fix this? Any help.






