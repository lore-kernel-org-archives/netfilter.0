From: Tommy McNeely <Tommy.McNeely@Sun.COM>
Subject: OT: curious about eth0/eth1
Date: Tue, 07 Jan 2003 16:59:53 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6620000.1041983993@leverage>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


I am curious about why people choose to make a certain interface internal 
or external...

I have always made my "eth0" interface my inside interface.. and once I 
have the box UP and RUNNING (and firewalled), then bring up my outside 
interface "eth1" ... My primary network for smb/nfs/whatever is my inside 
network (thus eth0)... The outside interface is just a "extra interface" 
that I can add on (or move/change/delete) or even make it ppp0 if I happen 
to be changing ISP's :)

I notice several people pick eth0 as their outside interface, and sorta "oh 
yea" the rest of the inside network is on eth1.  I know the linux kernel 
could really care less what they are called, its mostly a "neatness" thing 
I guess... Also it seems like that leaves your box open to attack from the 
time it installs (if you do a NET based install) till the time you get 
around to actually putting a firewall on it.

Again.. I am just curious as to why some do it one way.. and some the 
other... the above is only MY opinion, and could be dreadfully wrong :)

Tommy



--
Tommy McNeely         --        Tommy.McNeely@Sun.COM
Sun Microsystems - IT Ops - Broomfield Campus Support
Phone:  x50888 / 303-464-4888  --  Fax:  720-566-3168


