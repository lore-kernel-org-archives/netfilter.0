From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 23:48:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c2ca44$11745a20$026410ac@honor>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB572@EXCHANGE>
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
To: Khanh Tran <khanh@slc.edu>, netfilter@lists.samba.org

From: "Khanh Tran" <khanh@slc.edu>

> It's logging just fine and showing up in my logs, but it's missing the MAC
> address.  I've seen the MAC address show up in logs from other peoples'
> posts and such.  Am I missing a log option switch?  Possibly something not
> compiled in my kernel?  Not loading a module?  Thanks in advance...

maybe the logged stuff doesnt come from any adjacent computer...

you will only see MAC addresses of directly connected computers, or machines
behind a machine that runs any sort of proxy arp.

if that is not the case then a MAC address will get discarded at the next
hop



