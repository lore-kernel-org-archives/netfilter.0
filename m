From: Bob Hillegas <bobhillegas@houston.rr.com>
Subject: Re: Placement of Iptable Scripts
Date: Sun, 7 Jul 2002 20:10:11 -0500 (CDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0207071954020.1431-100000@east.rosestar.lan>
References: <20020705040808.A0EDC4455@lists.samba.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020705040808.A0EDC4455@lists.samba.org>
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

The best place I have found to place such script is immediately after bringing 
up the interface. Especially on interfaces that get their ip address changes by 
the ISP.

Redhat looks for (in /etc/sysconfig/network-scripts/ifup) and executes if found, 
/sbin/ifup-local. Define it and put into it a reference to the script that 
builds your rules. If you face the dhcp problem, pass the interface name to the 
script as an argument and parse the ip address from an invocation of 
/sbin/inconfig.

If your interface ip is non-changing, run the script, execute 
/etc/rc.d/init.d/iptables save

You will get those same rules back every time your system does an 
/etc/rc.d/init.d/iptables start

One note: an iptables start only invokes the actual iptables rules. Other 
commands commonly embedded in such "define scripts", such as, echo 1 > 
/proc/../../etc/etc, don't get issued.

-- 
----------------------------------
Bob Hillegas
bobhillegas@houston.rr.com

On Thu, 4 Jul 2002 Mark_Vuong@Dell.com wrote:

  > 
  > From: Mark_Vuong@Dell.com
  > To: netfilter@lists.samba.org
  > Subject: Placement of Iptable Scripts
  > Date: Thu, 4 Jul 2002 21:57:16 -0500
  > 
  > I'm relatively new to iptables and have the following question.
  > 
  > where is the best place to place my iptable bash script so that it loads my
  > iptable chains and rules when my server reboots?
  > 
  > Thanks!
  > 
  > Mark


