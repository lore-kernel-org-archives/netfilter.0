From: Adrian Hobbs <Adrian.G.Hobbs@uts.edu.au>
Subject: How do you specify an odd group of hosts?
Date: Thu, 16 May 2002 09:12:56 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <7cc8c8300a.8300a7cc8c@uts.edu.au>
Reply-To: aghobbs@uts.edu.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
Content-language: en
Content-Disposition: inline
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
To: netfilter@lists.samba.org

I am wondering what is the best way to specify an odd group of hosts. For 
example, I want to allow managment hosts access to 192.168.0.5. The 
managment hosts are 192.168.1.4, 192.168.1.12, 192.168.1.96.

As far as I can tell from the iptables docs you can only specify groups by 
netmask according to the following extract from the packet filtering 
HOWTO:
*******************************************************
The third and fourth ways allow specification of a group of IP addresses, 
such as `199.95.207.0/24' or `199.95.207.0/255.255.255.0'. These both 
specify any IP address from 199.95.207.0 to 199.95.207.255 inclusive; the 
digits after the `/' tell which parts of the IP address are significant. `/32' or 
`/255.255.255.255' is the default (match all of the IP address). To specify 
any IP address at all `/0' can be used, like so: 
*******************************************************

This will not work with odd hosts such as the management hosts above.

Should I create a managment chain where I list all the managment hosts 
and accept the packet if it matches a managment host and use this chain 
as the target? 

eg:
iptables -A FORWARD -p tcp -d 192.168.0.5 --dport 22 -j MNG_HOST

iptables -A MNG_HOST -s 192.168.1.4 -j ACCEPT
iptables -A MNG_HOST -s 192.168.1.12 -j ACCEPT
iptables -A MNG_HOST -s 192.168.1.96 -j ACCEPT
iptables -A MNG_HOST -j DENY

I think this could be a little cumbersome when dealing with large numbers 
of hosts. Maybe a comma separated list of source hosts would be good, 
or a way to group.

Adrian.





UTS CRICOS Provider Code:  00099F

DISCLAIMER
========================================================================
This email message and any accompanying attachments may contain
confidential information.  If you are not the intended recipient, do not
read, use, disseminate, distribute or copy this message or attachments.
If you have received this message in error, please notify the sender
immediately and delete this message. Any views expressed in this message
are those of the individual sender, except where the sender expressly,
and with authority, states them to be the views the University of
Technology Sydney. Before opening any attachments, please check them for
viruses and defects.
========================================================================



