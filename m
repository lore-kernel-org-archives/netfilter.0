From: "Jason Pappas" <jpappas@sharemedia.com>
Subject: Re: Two Interfaces Same Network / Netmask
Date: Tue, 11 Jun 2002 11:03:26 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001f01c21159$274107d0$6400780a@win.pappasfamily.net>
References: <000501c210be$a97a7240$7b0010ac@dynamicaccess.lan>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Interesting question.. First question, why would you want 2 interfaces with
addresses on the same network?  What is your network setup?
 As to your questions:

> for some reason it does not work for me ??? it only lets packets down one
> adapter ???

Your routing table will chose a single adapter to exit on.  You can have two
routes to this network using both interfaces but there is no guarentee that
packets will enter or leave via the same one without some work.  See my
later link.  Are these interfaces on the same physical ethernet?

> does iproute2 allow for you to have say a PPP link and a NIC so that your
> External Public Address Set
> is somehow maybee bridged to the nic and this nick also can be used as the
> Deafult Gateway for the rest of the Network ?

You would still run into routing issues that if your PPP connection had an
address of 65.65.65.99 and your private network was 172.16.0.0/16 that
machines on your network would not know the 65.65.65.99 address.  You would
have to arp or use NAT.  If your PPP is to the internet, you would need to
NAT or MASQ the connection as the source address is not routable.


