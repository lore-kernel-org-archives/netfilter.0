From: Khanh Tran <khanh@slc.edu>
Subject: RE: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 18:07:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB574@EXCHANGE>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Sascha Reissner <sascha.reissner@toxicnet.de>, netfilter@lists.samba.org

Well, the only thing separating our internal IPs from the NIC on the
firewall box is Packeteer.  I'm not sure if it would be considered a proxy
arp, although it sounds like it might.  Packeteer does our bandwidth
shaping/control.  If it is a proxy arp, is there any way I can get the MAC
addresses logged?  Basically, we have our firewall not logging anything
right now.  I suppose the addition of any logging would be better, but
everyone gets a dynamic DHCP address.  If I needed to track something down
in the log, I really couldn't tie it to a computer at all.  Any ideas?

Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: Sascha Reissner [mailto:sascha.reissner@toxicnet.de]
Sent: Saturday, February 01, 2003 5:49 PM
To: Khanh Tran; netfilter@lists.samba.org
Subject: Re: netfilter/iptables LOG not logging MAC addresses


> It's logging just fine and showing up in my logs, but it's missing the MAC
> address.  I've seen the MAC address show up in logs from other peoples'
> posts and such.  Am I missing a log option switch?  Possibly something not
> compiled in my kernel?  Not loading a module?  Thanks in advance...

maybe the logged stuff doesnt come from any adjacent computer...

you will only see MAC addresses of directly connected computers, or machines
behind a machine that runs any sort of proxy arp.

if that is not the case then a MAC address will get discarded at the next
hop




