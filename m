From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: capture arp in hook and queue to userspace
Date: Wed, 25 Aug 2004 11:09:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62EABD@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>, aksingh@hss.hns.com, magnus@comcon.se
Cc: netfilter@lists.netfilter.org

Doesn't etables handle ARP packets?

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Hudson
Delbert J Contr 61 CS/SCBN
Sent: Wednesday, August 25, 2004 11:07 AM
To: 'aksingh@hss.hns.com'; magnus@comcon.se
Cc: netfilter@lists.netfilter.org
Subject: RE: capture arp in hook and queue to userspace

buy a sniffer or check out dug song's modules at monkey.org.

v/r,
~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of
aksingh@hss.hns.com
Sent: Wednesday, August 25, 2004 3:16 AM
To: magnus@comcon.se
Cc: netfilter@lists.netfilter.org
Subject: Re: capture arp in hook and queue to userspace






ARP packets are not really IP packets, hence I dont think you can catch
them using netfilter hooks as they sit in the IP layer.

regards
Amit




"Magnus Westbergh" <magnus@comcon.se>@lists.netfilter.org on 08/25/2004
02:54:30 PM

Please respond to magnus@comcon.se

Sent by:    netfilter-bounces@lists.netfilter.org


To:    <netfilter@lists.netfilter.org>
cc:

Subject:    capture arp in hook and queue to userspace



Hello,

I intend to capture all incoming packets (IP and ARP) and queue them for
userspace using the ip_queue module, and let my userspace application
make
all verdicts. I have written a module using netfilter, and successfully
queued all IP-packets, but now I have no clue how to capture the ARP
packets, using this hook...

my_pre.hook        =3D my_in_hook;
my_pre.hooknum     =3D NF_IP_PRE_ROUTING;
my_pre.pf          =3D PF_INET;
my_pre.priority    =3D NF_IP_PRI_FIRST;

unsigned int my_in_hook( unsigned int hooknum,
                         struct sk_buff **skb,
                         const struct net_device *in,
                         const struct net_device *out,
                         int ( *okfn ) ( struct sk_buff *) )


How does the ARP hook work? What do I have to change to capture all ARP
packets? Please show me an example
Thanks for helping me,

Sincerely Magnus





*****************    HSS-Unclassified    *************



