From: "PiSiC..." <pisic@service.agress.ro>
Subject: Re: possibly annoing ...
Date: Thu, 27 Feb 2003 20:14:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c2de8c$263cc620$c80da8c0@service.agress.ro>
References: <OFBFE62721.93AFC0AB-ON80256CDA.005ECFD9@start-global.com>
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
To: richardo@start-global.com
Cc: netfilter@lists.netfilter.org

 First of all thanks for help ...
 but i'm kinda new with iptables and i want to show you the big picture :

 - i heard something about static NAT and dynamic NAT (not source or
destination NAT) and i'm not sure i fully understand what is the
aplicability on my situation.

the situation is this :

 i have a radio link with only one staticaly allocated  IP (aaa.bbb.ccc.ddd)
which is connected on my linux machine on eth1
eth0 on the same machine is connected on LAN.
I have up and running Webserver,SMTP,FTP and POP3.
I want to run now 2 webservers one on external and one on internal(that is
easy with binding on their interfaces).
But i want also to allow access from the world to a third webserver which
runs on 192.168.13.199:80 which will be accesibile on port 33333 on my
external ip.

... my machine runs Slackware 8.0 with kernel 2.4.5. and i have compiled the
kernel with all the features included(i don't need modprobe).


I wonder if you can give me an rc.firewall for this situation or at least
the tricky part(webserver on 192.168.13.199) with all their related stuff.

       Thank you very much in advance.

                                                      Danila Octavian




