From: "semi linux" <linuxsemi@gmail.com>
Subject: rtacct: history is aged out, resetting
Date: Fri, 8 Jun 2007 08:56:51 -0700
Message-ID: <e53321d30706080856m28ff0a21k397289bb5432377b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ScXocrm5OLrNU5mcxWONPUw7MLYxxQhQormBWbhpwvxjHczaJIUDDiVzRwfWTi7Zszk9SO8FPDNw0hetMdfoRvR+eSZ2Jn/iaqJi4pNC+tbNbZz0609GNANuSjXE8PaX3xedA0uILoSe79K2zRv5Shn7H7G2agVpuou537TWJMs=
Content-Disposition: inline
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

I'm trying to debug a routing setup where I have iptables running to
mangle and NAT packets on a bridge... I can see my packets being
mangled by hitting both rules but when trying to verify they hit an
alternate table using rtacct I get the following error message and
output:

[root@localhost ~]# rtacct
rtacct: history is aged out, resetting
#kernel
Realm    BytesTo    PktsTo    BytesFrom    PktsFrom
         BPSTo    PPSTo    BPSFrom    PPSFrom


Here's my route command:
# ip route add default via $GATEWAY dev br0 table $TABLE_NAME realms 2

And the command is successful with the realm properly listed as "2"...

I just want to see if my packets are hitting this table or not... Any ideas?

TIA,
    Gareth

