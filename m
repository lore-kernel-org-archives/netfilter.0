From: "Garske, Tom" <Tom.Garske@Rbcdain.com>
Subject: Host Header Redirection
Date: Mon, 10 Feb 2003 15:23:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <63E932E46E27594EA06BB4505F87E4634B59DC@MAILMP2.corp.isib.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Do you know if IPTABLES will allow you to port forward/redirect name =
based virtual hosting based upon the host header request?  If so, how?

example:

Client Request
www.test1.com  -----> Firewall              ----------> Internal Web =
Server hosting test1.com           =20
10.0.0.1                    eth1 10.0.0.1	          192.168.1.10
www.test2.com ----->  eth0 192.168.1.1 ----------> Internal Web Server =
hosting test2.com
10.0.0.1		                                              192.168.1.11
					     	=09

