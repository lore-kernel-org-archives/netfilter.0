From: <bhartin@straus-frank.com>
Subject: ipchains compat/active ftp?
Date: Wed, 22 May 2002 09:28:59 -0500 (CDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0205220926150.32435-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


I'm using a 2.4.x series kernel, but due to time constraints lately, I'm
using the ipchains compatability module and our old ipchains scripts.
Unfortunately, I have yet to find how to get active ftp connections
working through this.  The ftp module appears to be for pure iptables use
only, and there are no individual modules to be seen for the ipchains
compatability.

What am I missing?  Is there something that's just not very well
documented on this, or am I basically screwed until I re-write everything
for iptables?

Thanks,

-- 
Bradley Hartin - bhartin@straus-frank.com
Communications and Network Administrator
Straus-Frank Company


