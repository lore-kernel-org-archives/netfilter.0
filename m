From: richard <rich@thevillas.eclipse.co.uk>
Subject: snat and narc
Date: Mon, 02 Apr 2007 14:27:57 +0100
Message-ID: <461104DD.1000801@thevillas.eclipse.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi I have a question regarding SNAT and narc


Basically, our webserver resides at 192.168.1.x on the LAN.  To the 
outside world it is at xxx.xxx.xxx.xxx(this is actually our firewall 
that forwards traffic through to the webserver on the LAN at 192.168.1.x)
So, users outside the LAN just point their browsers at xxx.xxx.xxx.xxx.

In order to allow this we have a rule like:

 iptables -t nat -p tcp -d xxx.xxx.xxx.xxx --dport 80 -j DNAT 
--to-destination 192.168.1.x

Pointing the browser to xxx.xxx.xxx won't work for users on the LAN. For 
these people, i need something like:

 iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d 
xxx.xxx.xxx.xxx --dport 80 -j SNAT --to-source 192.168.1.Y
 (192.168.1.Y is the internal LAN address of the firewall)

I have put this last rule in the narc-custom file but it doesn't seem to 
work.
Any ideas?

Thanks in advance

Rich

