From: "Warren P" <warrenp@websurfer.co.za>
Subject: ip_conntrack
Date: Mon, 25 Nov 2002 14:00:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211251200.gAPC0d408705@mailgate.mailbox.co.za>
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

Hi

I'm receiving the following messages in /var/log/messages
kernel: ip_conntrack: table full, dropping packet.
My ip_conntrack_max = 65528.
I'm running a squid proxy and the messages did not bother me, until
last few days, when the proxy's responses deteriated heavily.
If ip_conntrack is the causing the problem, please indicate as to how
I determine what the prefered size of ip_conntrack_max should be
considering that I have 1gig of RAM in the machine.

_______________________________________________________________
 http://www.webmail.co.za the South-African free email service

  NetWiseGurus.Com Portal - Your Own Internet Business Today!


