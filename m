From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: How filter IP address if it *changes* often?? (think dhcp)
Date: Wed, 28 Mar 2001 08:51:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c0b7a7$6804a450$1001a8c0@s3ac>
References: <20030327200056.A18916@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20030327200056.A18916@spawar.navy.mil>
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
To: seberino@spawar.navy.mil, netfilter@lists.netfilter.org


> How do this if IP address changes uncontrollably
> like with DHCP??


The following sh script will extract the ip address of the external
interface. If the address changes forcable ie not just when you renew
your lease volentarily then run the script on cron

$IFCONFIG = /path/ifconfig
$EXTIF = ppp0 or whatever
$AWK=/patch/awk

EXTIP="`$IFCONFIG $EXTIF | $AWK \
 /$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"


