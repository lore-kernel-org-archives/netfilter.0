From: patrick conlin <patrick@wechsler.com>
Subject: general policy question
Date: Thu, 06 Jun 2002 17:44:21 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <B9254FF5.1C46%patrick@wechsler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

does one generally set the -P on their mangle table chains to DROP, even if
you're not using them for anything?

usual procedure says set -P on all chains to DROP and allow what's
necessary, but if you're not using your mangle table chains for anything and
you set -P to DROP (on the iptables -t mangle PREROUTING chain, for example)
all packets get dropped.

you guessed it, I just did this and got booted from the machine. Now I have
to wait until I can go home and reboot my firewall before I can play with it
any more.

Just wondering how everyone else handles this.

-=p=-


