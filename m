From: "Technical" <technical@sojourn.dyndns.org>
Subject: Ip tables is not startting up FC1
Date: Thu, 11 Mar 2004 10:42:41 -0500 (EST)
Sender: fedora-list-admin@redhat.com
Message-ID: <2577.128.59.176.161.1079019761.squirrel@sojourn.dyndns.org>
Reply-To: fedora-list@redhat.com
Mime-Version: 1.0
Return-path: <fedora-list-admin@redhat.com>
Errors-To: fedora-list-admin@redhat.com
List-Help: <mailto:fedora-list-request@redhat.com?subject=help>
List-Post: <mailto:fedora-list@redhat.com>
List-Subscribe: <http://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=unsubscribe>
List-Archive: <http://www.redhat.com/archives/fedora-list/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, fedora-list@redhat.com

When I reboot my box, iptables does not run.

if I service iptables start|stop iptables get start it.  I checked
chkconfig and iptables is on on run level 3 and 5.  what could be wrong;
which log can look into to see why ipatabels is not launching on reboot?


-- 
fedora-list mailing list
fedora-list@redhat.com
To unsubscribe: http://www.redhat.com/mailman/listinfo/fedora-list
