From: "Warren P" <warrenp@websurfer.co.za>
Subject: Redirecting to more than 1 port.
Date: Wed, 19 Feb 2003 19:23:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302191723.h1JHNAq26668@mailgate.mailbox.co.za>
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
To: netfilter@lists.netfilter.org

hi

I want to run 2 instances of SQUID (Transparent Proxy). Currently I'm
running only one instance of squid and my IPTABLE is as follows:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128

My 2nd instance of Squid will run one port 8080, will the following
configuration be correct:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128:8080

If not, can you please advice.
_______________________________________________________________
 http://www.webmail.co.za the South-African free email service

  NetWiseGurus.Com Portal - Your Own Internet Business Today!


