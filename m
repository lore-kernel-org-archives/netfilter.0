From: "Antonio Paulo Salgado Forster" <aforster@br.ibm.com>
Subject: Re: Using heartbeat for fall over on IPTables Firewall
Date: Mon, 17 Mar 2003 13:51:14 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF3F839083.CA2009BC-ON83256CEC.005C8032@LocalDomain>
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
To: Chip Upsal <cupsal@cyberwolf.com>
Cc: netfilter@lists.netfilter.org


Suggestion: Try using keepalived instead.

Regards,

Forster


Chip Upsal <cupsal@cyberwolf.com>@lists.netfilter.org on 03/17/2003
01:16:46 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org, "'linux-ha@muc.de'" <linux-ha@muc.de>
cc:
Subject:    Using heartbeat for fall over on IPTables Firewall



I am looking to use heartbeat to provide fall over for my iptables
firewall.
I am looking for those with experience using these tools together.

I plan to use RH7.2 on the firewalls.

I made some attempts at implementing such a solution but i ran into a few
problems.

I would like suggestions on setup of the heartbeat configuration files.
Pointers on the iptables startup script. and advice on what kernel version
to use and if any patches need to be applied.

Thanks in advance,

Chip




Chip Upsal
SysAdmin
CyberWolf Inc





