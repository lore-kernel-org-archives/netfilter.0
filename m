From: jmc <jmc@_REMOVE_prioris.mini.pw.edu.pl>
Subject: Autoloading h323 module
Date: Thu, 23 May 2002 17:28:36 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020523172836.GA32496@62-moo-3.acn.waw.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,
I am trying to autoload <via kmod> some modules from iptables,
specifically ip_conntrack_h323.o. I can load it manually, but to do it
automatically I need to have the correct info. in my /etc/modules.rc file.
If anyone else uses this method of module loading and can help me with my
options I would be very grateful.

The rest of iptables seems to load OK without any options in my
modules.conf file which makes me think I might be using the module
wrongly. I simply expect it to autoload when an h323 connection is made.
In my rules I just use:

iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

Someone please correct me if this is not the case.
The modules which I have loaded are:

ipt_state
ip_conntrack
iptable_filter
ip_tables

I have checked the files in the source, the FAQ's and archives but can't
find anything on how to do this. I also saw someone else with the same
trouble, but their question went unanswered.

Many thanks for any help,
Jmc.

