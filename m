From: "Tim" <tim-lists@cimx.com>
Subject: problems routing
Date: Mon, 24 Jun 2002 11:43:38 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <007101c21b95$e87a6e50$5064a8c0@optimus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

I have a 192.168.100.0 network with my iptables box sitting at
192.168.100.12 and a mailserver at 192.168.100.10 and also with a public ip
and name.

I have several users who are both on the road and work in the office
commonly.

I want to make a rule for them so that when they request mail.cimx.com it
redirects to 192.168.100.10.

I tried to make the following rule:
iptables -t nat -A PREROUTING -p tcp -d $MAIL_IP -j REDIRECT 192.168.100.10
but it seems to not work.

I then changed it to:
iptables -t nat -A PREROUTING -p tcp -d 204.192.102.210 -j LOG
to see the request and I see the request in the logs.

Is there something I am missing?

Thanks in advance.
-- Tim


