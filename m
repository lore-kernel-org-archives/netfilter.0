From: Michael Gale <mgale@utilitran.com>
Subject: Running other commands / scritps
Date: Tue, 9 Dec 2003 10:11:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209101100.7dd37e4e.mgale@utilitran.com>
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

Hello,

	Two questions:

1 - first -- I have a firewall implementation that requires 22 virtual IP's so I have a file for each IP to help in administering the firewall. Each IP has it owns user defined chain as well.

Anyways I have about 10-15 variables that each script needs -- I do not want to add all the variables to the top of every script all the time. Adding a new one is also a pain in the A$$. 

Does anyone know how I could make a set of global variables that the firewall scripts can access when they start up. 

I know it is kind of off topic :(

2. -- Is there a way to have iptables run a command or execute another script based on a rule :)

-- 
Michael Gale
Network Administrator
Utilitran Corporation

