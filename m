From: Jesse Keating <hosting@j2solutions.net>
Subject: Re: NAT, conntrack, FTP, multihomed host
Date: Thu, 10 Oct 2002 09:01:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021010090150.103d4033.hosting@j2solutions.net>
References: <Pine.LNX.4.44.0210101002330.11967-100000@ward.neo-neural.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210101002330.11967-100000@ward.neo-neural.net>
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

On Thu, 10 Oct 2002 10:20:48 -0500 (CDT)
netfilter.org@neo-neural.net wrote:

# 
# The "router" is currently using the gShield 2.8 iptables script,
# although I've tried many, many simple and/or insecure scripts or
# hand-entered rules with exactly the same result; active FTP will not
# work. (Passive works, and yes, I try to use it all the time... but
# active should work, darn it!) I've googled until my eyes are red and
# blurry, and yes, I've read the tutorial and the HOWTOs... when I
# follow the directions to the letter, nothing works. Essentially, it
# appears that the NAT module doesn't know what to do with the
# incoming server connection: I can see it arrive via tcpdump, but it
# is never forwarded to the workstation in question when the "proper"
# iptables rules are in place.

Hrm, it was my understanding that ip_conntrac_ftp was for INCOMING ftp
stuff, like if you were running a FTP server behind a NAT box...

I use a simple little linksys NAT device for my lan, and it doesn't do
conntrac_ftp stuff ( I can't run a passive FTP server behind it ) but
I am able to connect to all kinds of remote passive servers.  Active
is when you only use the one port, passive is when you get to use a
range of ports.

-- 
Jesse Keating
j2Solutions.net
Mondo DevTeam (www.mondorescue.org)

Was I helpful?  Let others know:
 http://svcs.affero.net/rm.php?r=jkeating

