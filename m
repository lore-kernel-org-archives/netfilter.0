From: "Klemen Kecman" <klemen@sting.si>
Subject: Re: ULOG
Date: Wed, 21 Jan 2004 09:04:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005b01c3dff5$28549800$6a02a8c0@klemen>
References: <20040121004046.GG8389@freenet.de> <400DD1E6.4060706@plobe.com>
Reply-To: "Klemen Kecman" <klemen@sting.si>
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

You can find more info here.

http://www.stearns.org/doc/iptables-ulog.current.html

----- Original Message ----- 
From: "XiChimos" <xichimos@plobe.com>
To: "Michelle Konzack" <linux4michelle@freenet.de>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 21, 2004 2:12 AM
Subject: Re: ULOG


> Is there any reason why tcpdump wouldn't work?
> 
> apt-get install tcpdump
> 
> Then you can do 'tcpdump -i ppp0 -w FILENAME dst 192.168.1 '  What this 
> does is takes all the packets from ppp0 bound for the range 192.168.1.* 
> and throws them in FILENAME. Then if you wanted to break things up, you 
> could use grep:
> 
> grep 192.168.1.1 FILENAME > 192.168.1.1_file
> 
> You would do that for each IP.
> 
> You can always do 'man tcpdump' or 'man grep' if you want to do or know 
> more.
> 
> You could also try ethereal.  I would use either one of these instead of 
> modifying the firewall, unless you have good reason to not use these 
> programs.  I hope that helps.  Check out 'man iptables' to see what 
> iptables offers.
> 
> Chris
> 
> Michelle Konzack wrote:
> 
> >Hello, 
> >
> >I am using Debian GNU/Linux 3.0r2 WOODY and have installed the 'ulogd' 
> >Packge. 
> >
> >I like to log the traffic in my ADSL-Interface ppp0 
> >But I do not know, HOW !
> >
> >All tries are faild.
> >
> >Can anone tell me the rule ?
> >
> >Oh yes, is it possibel to log the traffic from ppp0 to a 
> >specified IP-Adress inside my Network in a seperated file ?
> >
> >I like to have for each IP/Server (26 complet) in my private 
> >network a logfile.
> >
> >Thanks
> >Michelle
> >
> >  
> >
> 
> 


