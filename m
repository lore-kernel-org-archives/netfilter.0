From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: SuSE Linux and iptables
Date: Sat, 29 May 2004 14:05:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405292105.i4TL5qeV012538@server5.bandwidthco.com>
References: <s0b89584.043@webmail.minorplanetusa.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0b89584.043@webmail.minorplanetusa.com>
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
To: 'Erick Sanz' <esanz@minorplanetusa.com>, netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Erick Sanz
Sent: Saturday, May 29, 2004 11:52 AM
To: netfilter@lists.netfilter.org
Subject: SuSE Linux and iptables

All,

I just changed from Red Hat Linux 9.0 to SuSE Linux 9.1; I had several rules
working at home that I would like to use in SuSE; however, SuSE comes with
its own version of firewalling (tied with YaST); I don't want to use their
version (it does not do *exactly* what I want)...

I tried to unistall their SuSEfirewall2 package; however, it is linked to
yast, which is linkded to DHCP and it goes on with the dependencies...

I just want to turn their firewall off and start iptables on my own, with my
own rules...

Has anyone done this?

Beforehand, thank you for your help!


This email message has been scanned for viruses.



Yes - I run a five NIC Iptables/netfilter firewall with SUSE 9.1.  By the
way, I love it. Just a couple of tips and you are on your way.

1. The Yast version is started with three scripts in the /etc/init.d
directory, all starting with SuSEfirewall2*.  Just run chkconfig to disable
all three:

chkconfig SuSEfirewsall2** off

2. Write your own script and place it in the /etc/init.d directory. Either
start it up manually from there, or soft link it into rc3.d and rc5.d for
bootime startup. Activate it the same way you deactivated the Yast version:

chkconfig firewall_script_name on

It's just that simple. Have fun.



########################################################
This message has been scanned for viruses and dangerous 
content by MailScanner, and is believed to be clean.

postmaster@bandwidthco.com
MailScanner at bandwidthco.com is for your absolute protection.
########################################################


