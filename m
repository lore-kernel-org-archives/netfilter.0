From: Beau Sapach <beau.sapach@ualberta.ca>
Subject: mac-source matching
Date: Mon, 26 Apr 2004 12:15:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083003321.408d51b9cea5e@webmail.bme.med.ualberta.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello everyone,

I have a system running redhat with kernel 2.4.26 and iptables 1.2.1a that is a 
routing firewall.  If I use the mac-source extension to match packets from the 
internal network (a workstation for which this system is the gateway) it works 
fine, but it won't match packets originating from the outside world.  The rule 
I use is this:

iptables -A FORWARD -m mac --mac-source 00:00:00:00:00:00 -j ACCEPT

It could be me, I may be completely misunderstanding how this is supposed to 
work.  I am by no means a guru.... any help would be appreciated, thanks!

Beau

