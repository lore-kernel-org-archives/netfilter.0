From: "Darryl Romano" <dromano@vmware.com>
Subject: RE: Block smtp traffic
Date: Thu, 26 Oct 2006 12:44:10 -0700
Message-ID: <882A4B7A51024043B9E5EA13382DF2110151572A@PA-EXCH03.vmware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: Allan Spagnol Comar <allan.comar@gmail.com>, netfilter@lists.netfilter.org

If the server that you are running this rule on is the same server as =
your
smtp, then you should change the rule to -A INPUT.

Regards,
Darryl Romano, VCP, RHCE
VMware Technical Support
=20
1-877-4-VMWARE
1-877-486-9273
=20
Use our Knowledge Base to search for
Troubleshooting information:
http://www.vmware.com/kb
=20
VMware Community Access:
http://www.vmware.com/community/index.jspa


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Allan =
Spagnol
Comar
Sent: Thursday, October 26, 2006 3:36 PM
To: netfilter@lists.netfilter.org
Subject: Block smtp traffic

Hi list, this is my first post.

I had a internet gateway that I want to block all traffic send to smtp
ports ( 25 tcp ). I had done this:
iptables -A FORWARD -i eth1 -p tcp --dport 25 -j DROP

and I cannot make this rule work, my user still can connect to port
25.... I try to change from drop to reject and still the same problem,
where can I look for to make this work ?

thanks, Allan

--=20
An application asked:
"Requires Windows 9x, NT4 or better",
so I=B4ve installed Linux


