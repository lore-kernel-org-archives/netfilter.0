From: "yomega" <yomega@wahooo.net>
Subject: IP Traffic Accounting
Date: Sat, 22 Jun 2002 16:02:06 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi List,

i want to set up IP Traffic Accounting. I wanna to measure the Traffic which
comes in and goes out on specified Ports.

After reading some IPTABLES Manuals and testing some with my Linux
Fileserver, i thought of doing exactly this by that way:
I create Rules to Log the specified Ports: iptables ..... -j
log --log-prefix [name] <- this one :) Because of my syslog Settings, the
Packets are logged into /var/log/firewall
Ok now i make a Cron with a little Python or PHP Script that analyses the
logged packages, and flushes the Log File empty :). The Cron is executed
every 5 minutes.

OK this should work, but i still got a question:

First i start to realize that my log file will become very big with even
little outbound traffic. Now the cron is exectued and all the data written
on the hd is analysed and written on the hd. I'm afraid that this will
injure the health of the HD. Is there any other maybe more "clean"
possibility to do that loggin? or have i made some mistakes in my thoughts?

Maybe everthing happens in the RAM (syslog and analysing)? So this would not
be a hd health prob?

Thanx 4 all suggestions :)

Greetz,
Stephan


