From: eanhard@inorbit.com
Subject: Script Help
Date: Thu, 27 Jun 2002 20:47:05 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628014705.57287.qmail@iname.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
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

Hi,
I am having problems with some scripts, i use lines like this ( export IP_INET=`/sbin/ifconfig $IP_ETH0 | grep inet | cut -d: -f2 | cut -d\  -f1`; ) in my .bash_profile file to add environment variable to use with my firewall script then call them like iptables -A INPUT -s $IP_NET -j ACCEPT this works ok. The problem i am having is i have a dhcp assigned connection to another office, i am trying to add this line to my firewall script so it will check the ipaddress of my work connection and set the environvemt variable from there (ie: export IP_WORK=`host work.net.au | grep address | cut -f4 -d" "`; ), can anyone tell me how i can run this line from my firewall script and not my .bash_profile script, i can t seem to get it working, is it possible to have an env script that sets all the variables first??.. sorry if this is not totally iptables realted but some help would be apreciated so i can fine tune my firewall.

ps: yes im a newbie.....
-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

Save up to $160 by signing up for NetZero Platinum Internet service.
http://www.netzero.net/?refcd=N2P0602NEP8


