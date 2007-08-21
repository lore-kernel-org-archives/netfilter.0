From: "michel banguerski" <banguerski+nfdev@gmail.com>
Subject: Re: Rout looping through local host.
Date: Tue, 21 Aug 2007 19:36:15 +0200
Message-ID: <cba9bb580708211036x5238f265med415e4ce2cbcde0@mail.gmail.com>
References: <46CB0F78.3060107@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=K7k9+/kzY6WeGvEeW8p3Yu9zGDs5rH3cEik5AIs+W0/iYlZb7JDzJ9MQolhOfSbOyQ2fIumOb2BDCu5s0zwupNWR7lUn1wwt22/0HGfRWD6VE34htdXfVyfysLrpVFME2zryKiFHP9kbKo2FHU4L7G/ccntEDf1KKyQlks0aBXE=
In-Reply-To: <46CB0F78.3060107@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi Grant,

here's  my 2=A2:
there is no need to patch the kernel.
what you should do is PBR and little arp hacking:
let's say your eth0 is 10.0.0.1/24
what i'd do is to put eth1 and eth2 in different subnets:
eth1 -> 10.0.1.1/24
eth2 -> 10.0.2.1/24

default routes:
ip ro add default via 10.0.1.254 table 252 # from eth1 to eth2
ip ro add default via <gateway on eth3 side> table default # from eth3
to outside

PBR rules:
ip rule del prio 32766 # we need to put rules between lookup to main and de=
fault
ip rule add prio 100 lookup main # rule 32766 becomes 100
ip rule add 200 lookup 252 iif eth0 # alternative default route for local L=
AN

arp override:
arp -s 10.0.1.254 <ETH addr of eth2>

disable antispoof on eth{1,2} (may be not needed if you do NAT)
 echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
 echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter


there is one thing to look after: the dhcp client will put its default
route in table main(252) and you should move it from here to table
default(253)

This setup should work with or without NAT

one last thing:

if you happen to snat packets from local LAN(received by eth0) to
10.0.1.1(address of eth1) then IIRC you *will* need to patch the
kernel as incoming packets with source address that the linux box
considers as its own are dropped.


Hope this works(did not test this exact setup) and helps

Best regards
Michel

