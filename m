From: Petre Bandac <petre@kgb.ro>
Subject: is it possible only with iptables
Date: Wed, 10 Dec 2003 19:28:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312101928.27882.petre@kgb.ro>
Reply-To: petre@kgb.ro
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have 2 linux machines - linux_1 and linux_2

linux_1 has behind it a subnet with routable adresses (not private)

I want that all the traffic incoming from the subnet behind linux_1 and going 
to port 80 to be redirected to linux_2, and from linux_2 go on the internet

I presumed that a -j SNAT --to-source IP_linux_2 should be enough, but 
apparently it isn't

should I issue a SNAT rule on linux_2 too, or it should run something like 
squid there ?

thanks in advance,

petre


-- 
Login: petre          			Name: Petre Bandac
Directory: /home/petre              	Shell: /usr/local/bin/zsh
On since Tue Dec  9 10:15 (EET) on ttyv0, idle 1 day 9:08 (messages off)
Last login Wed Dec 10 16:05 (EET) on ttyp3 from ns.rdsbv.ro
No Mail.
No Plan.


