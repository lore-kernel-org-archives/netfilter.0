From: "Shazad Malik" <smalik@vistawiz.com>
Subject: ip_conntrack (1011 buckets, 8088 max)???
Date: Thu, 30 May 2002 23:00:23 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <2974.24.168.132.35.1022814023.squirrel@mail.vistawiz.com>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,

I have a question which may have been asked before but I will ask it anyway!
When I start iptables I get the following messages:

ip_conntrack (1011 buckets, 8088 max)

What exactly does bucket mean? and does the 8088 max mean that concurrent
8088 stateful connection at one time!  Can this value be increased and how
is this vlaue determined?

Cheers
hallian



