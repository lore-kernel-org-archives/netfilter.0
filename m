From: Mike Mestnik <cheako911@yahoo.com>
Subject: SNAT and DNAT ftp PORT and PASV cmds.
Date: Wed, 28 Apr 2004 23:11:36 -0700 (PDT)
Message-ID: <20040429061136.29136.qmail@web11907.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <bounce-debian-firewall=debian-firewall=m.gmane.org@lists.debian.org>
Resent-Message-ID: <xyISe.A.LAB.iyJkAB@murphy>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:debian-firewall@lists.debian.org>
List-Help: <mailto:debian-firewall-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-firewall-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-firewall-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-firewall/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: debian-firewall@lists.debian.org

On the debian-firewall list it was discussed that.  SNATed ftp using the
PASV cmd needed an outgoing rule.  Other than "state RELATED" when all
unmatched packets are DROPed.

I am wondering what is the current status of the ftp connection tracking
and ftp nat?  Can ipfilter handle SNAT and DNAT ftp for both the PORT and
PASV cmds?

Matrix  |  SNAT   |  DNAT   | NoNAT
PORT    |  ???    |  ???    | ????
PASV    |  ???    |  ???    | ????

Legend:
Yes, Connections are tracked.
Mangle, Connections are tracked and cmd is nated.
No, Connections are not tracked.

Your reply to debian-firewall@lists.debian.org is greatly appreciated.


	
		
__________________________________
Do you Yahoo!?
Win a $20,000 Career Makeover at Yahoo! HotJobs  
http://hotjobs.sweepstakes.yahoo.com/careermakeover 

