From: "Jason S. Friedman" <jason@powerpull.net>
Subject: Re: RedHat 8.0 upgrade problem 1.2.8
Date: Wed, 27 Aug 2003 03:14:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030827031448.GB31134@charles>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

My problem is mostly solved, and I wanted to post the resolution for the benefit of others who might troll the archives someday.

Something about the "service iptables restart" command tripped up the modules.  I re-installed the old 1.2.6a version using rpm --oldpackage -Uvh <rpm file here> and rebooted and I was back in business.  I suppose that someone more familiar with kernel modules could have avoided a reboot.

My next step is to re-upgrade using the RPM, but I won't enter "service iptables restart".  Instead, I'll just run my standard firewall shell script.

