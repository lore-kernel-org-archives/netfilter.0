From: Parkson <peirong@distinct.com>
Subject: rc.firewall script problem
Date: Mon, 10 Jun 2002 11:42:57 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D04F331.8040809@distinct.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi there,

I use the sample script given in Linux IP Masquerade HOWTO
(Section 3.4.1) for my Slackware box. I read from netfilter
homepage that it's better to start rc.firewall right after
the network is set up, so I start up the script in rc.inet2
before any network services.

I can ping the box from outside after it's up. But the WWW
server and SSHd is not accessible from outside. The strange
thing is that if rc.firewall starts after SSHd server and
before HTTPd, SSHd is accessible from outside while HTTPd
is not. If I start rc.firewall in rc.local in the last
step, both services can be accessible from outside.

What should be the explaination for this strange behavior
of iptables?

Regards,
A Newbie


