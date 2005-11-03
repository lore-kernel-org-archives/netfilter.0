From: "Harrison, James" <james.harrison@americancolor.com>
Subject: RE: Troubleshooting Netfilter Firewall (performance issues)
Date: Thu, 03 Nov 2005 12:24:19 -0600
Message-ID: <1131042260.3835.16.camel@localhost.localdomain>
References: <FAC4E024BF776842876169173CE2F013292A@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F013292A@mailbox.vikus.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-11-03 at 12:55 -0500, Derick Anderson wrote:
[snip]

> 
> If I were you I would monitor top during a large transfer and maybe do
> an ethereal dump as well. If your two endpoint machines are both on Gbit
> LAN and your firewall is 100Mbit (on a 100/1000 switch) then perhaps
> your firewall NICs are getting overloaded. Every night at my company all
> the servers (Gbit) back up to a local machine (100Mbit). They each have
> their time window for backing up but it's common for Nagios to report an
> "UNKNOWN" status for the backup server in the early morning hours. Of
> course that could simply be the poor little backup server not having the
> time to reply...
> 
> Derick Anderson

According to netstat -i I shouldn't be having issues with overloading
the interfaces. (TX-ERR on eth0 and eth1 are static and have not
incremented) I have 2/100MB and 2/1000MB interfaces.

Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0   1500 0  50757220      0      0      050703586    523      0      0 BMRU
eth0:  1500 0       - no statistics available -                        BMRU
eth1   1500 0  339989009      0      0      0397086634   3381      0      0 BMRU
eth1:  1500 0       - no statistics available -                        BMRU
eth2   1500 0  409181861      0      0      0344550753      0      0      0 BMRU
eth3   1500 0  11352902      0      0      015003672      0      0      0 BMRU
eth3:  1500 0       - no statistics available -                        BMRU

It is running on the Devil Linux distro.

-- 
James Harrison RHCE
Manager, Information Security
AIM: harrijh1

