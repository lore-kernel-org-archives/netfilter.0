From: "M" <micke@klintan.se>
Subject: Re: (no subject)
Date: Fri, 28 Mar 2003 15:05:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a901c2f533$1f6d7700$7055e00a@Michael>
References: <BAY1-F203e7sjbmDoP60000558c@hotmail.com>
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
To: Bryan Schmidt <absolut_bryan@hotmail.com>
Cc: netfilter@lists.netfilter.org


----- Original Message -----
From: "Bryan Schmidt" <absolut_bryan@hotmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, March 28, 2003 2:31 AM
Subject: (no subject)


> I am getting the following message when trying to use iptable (iptable -L)
> "iptables v1.2.6a: can't initialize iptables table `filter': iptables who?
> (do yo
> u need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded."
>
> It seems that I can't access any of the tables (filter,nat, or mangle).
> Does the kernel need to be modified?  How do I go about this? I am running
> Debain 3.0r1 on an UtraII.
>
> Thanks,
>
> Bryan Schmidt, MCSE, MCP + Internet
> Area101, Inc.
> MIS Director
>

Often this is that ipchains is loaded in memory. Remove ipchains from memory
with 'rmmod' command. Load the ip_tables module with 'insmod' or modprobe.

In Red Hat it would be...
# chkconfig ipchains off
# chkconfig iptables on
# rmmod ipchains
# insmod ip_tables

/Klitnan


