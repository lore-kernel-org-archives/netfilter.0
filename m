From: Patrick Schaaf <bof@bof.de>
Subject: Re: Iptables forwarding
Date: Thu, 27 Jun 2002 07:16:58 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627071658.A1873@oknodo.bof.de>
References: <1C61B9073EBFBD40B45FA90B8265B2DD1BE7@MELXCHW01.oz.quest.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1C61B9073EBFBD40B45FA90B8265B2DD1BE7@MELXCHW01.oz.quest.com>; from loc.huynh@oz.quest.com on Thu, Jun 27, 2002 at 01:48:58PM +1000
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Loc Huynh <loc.huynh@oz.quest.com>
Cc: netfilter@lists.samba.org

Hi,

> Unfortunately, there wasn't any message related to the forwarding.  it only
> told me the firewall has been stoped and restarted successfully.

Then the messages are either in a different file than the one I suggested
as likely, or they are not logged at all. As the LOG target is the prime
debugging tool for iptables, you definitely WANT to find out where it
logs to. You will have to configure your syslog daemon (/etc/syslogd.conf)
appropriately. Please, take some time to learn how to do that.

> I have found out that I need to open port 1025 -> 65535 then it works,

... and you have won nearly no security. Might as well not use iptables at all,
almost.

regards
  Patrick

