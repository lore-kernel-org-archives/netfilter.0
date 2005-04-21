From: Hernan Arredondo <hernan.arredondo@gmail.com>
Subject: Redirect Command
Date: Thu, 21 Apr 2005 08:26:43 -0500
Message-ID: <327bfad305042106267479b9@mail.gmail.com>
Reply-To: Hernan Arredondo <hernan.arredondo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I'm new with iptables, I trying to create a rule that redirect all the
packets that goes to the port 25 of my firewall to the port 25 in a
Internet LAN machine, then I execute the command:

/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT
--to 192.168.10.12:25

eth0 is the host exposed directly to Internet, and 192.168.2.12 is the
host in the LAN.

Now, this is not working, I try a telnet <eth0> 25 and nothing happen.

What's wrong here ? Can anybody help me ?

Hernan Dario Arredondo

--=20
No matter how fast processors get,
software consistently finds new ways to eat up the extra speed

