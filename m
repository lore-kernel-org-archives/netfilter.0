From: Michael <mutk@ozemail.com.au>
Subject: Re: Fwd: RE: MSN Messanger through a iptables firewall.
Date: Fri, 05 Jul 2002 09:32:55 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D24DB27.9070706@ozemail.com.au>
References: <200207041424.g64EOwU31986@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.samba.org>

Antony Stone wrote:

>Someone just posted this to me instead of the list.
>


Thanks Antony....

>
>
>Antony.
>
>----------  Forwarded Message  ----------
>
>Subject: RE: MSM Mesanger through a iptables firewall.
>Date: Thu, 4 Jul 2002 15:27:56 +0100
>From: <aaa.coms.sec@btclick.com>
>To: "Antony Stone" <Antony@Soft-Solutions.co.uk>
>
>might be me but what about the irc modules ? i.e.
>
You mean
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc

The modules below, as far as I can recall are for IPCHAINS, not iptables.
I could be wrong... my version of iptables does no have the modules 
listed below.

>
>
>/sbin/depmod -a
>/sbin/modprobe ip_masq_ftp
>/sbin/modprobe ip_masq_raudio
>/sbin/modprobe ip_masq_autofw
>/sbin/modprobe ip_masq_cuseeme
>/sbin/modprobe ip_masq_mfw
>/sbin/modprobe ip_masq_portw
>/sbin/modprobe ip_masq_quake
>/sbin/modprobe ip_masq_user
>/sbin/modprobe ip_masq_vdolive
>/sbin/modprobe ip_masq_irc
>
Cheers,
Michael


