From: Bill Davidsen <davidsen@prodigy.com>
Subject: Getting info from ifconfig output
Date: Wed, 12 Mar 2003 18:03:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E6FBCBF.3D80FAE@prodigy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Browsing the list I saw a question regarding using grep and friends
to get an IP. I do this, but to allow a single firewall config file to
be used on a number of machines without editing. Here are the first few
lines, I hope they are useful to someone. I extract the IP and the
broadcast (I don't always have 8 bit subnetting).


# define internal and external interfaces
int_i=eth0
ext_i=eth1
loopback=lo

# define the IP of the external address, only IP used
AdrsLine=$(ifconfig ${ext_i} | grep "inet addr:")
ext_ip=$(expr "$AdrsLine" : ".*inet addr: *\([0-9.]*\)")
Bcast=$(expr "$AdrsLine" : ".*Bcast: *\([0-9.]*\)")

-- 
bill davidsen (davidsen@tmr.com)
Doing interesting things with small computers since 1979.

