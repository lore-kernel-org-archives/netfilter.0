From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Dynamic kernel module load
Date: Thu, 24 May 2007 19:08:55 +0200
Message-ID: <4655C6A7.2050303@rtij.nl>
References: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
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
To: Paul Harlow <pharlow@skld.com>
Cc: Netfilter Lists <netfilter@lists.netfilter.org>

Paul Harlow wrote:
> Hi all,
>
> Fedora 5 patched, i386 SMP
>
> I am looking for info on how to dynamically load a particular kernel module when I restart IPTables. I have firewalling rules in place for FTP traffic (both passive and active) however when I restart IPTables I notice that the module ip_conntrack_ftp does not load, I have to load it manually. This presents a problem if someone other than myself has to reload firewall rules on this machine but isn't aware of the FTP rules/needs.
>
> Will adding the line "ip_conntrack_ftp" to the modules.conf file solve this problem and leave the particular module in permanently?
>   

Patch /etc/sysconfig/iptables-config, mine looks like:

# Additional iptables modules (nat helper)
# Default: -empty-
IPTABLES_MODULES="ip_conntrack_ftp"

(snip)

HTH,
M4


