From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Re: DMZ Question
Date: Tue, 5 Oct 2004 23:44:53 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <005e01c4ab56$d7201e40$02c8a8c0@floydian>
References: <7C9884991ADAE0479C14F10C858BCDF591E381@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org
Cc: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>

Hello Daniel & John,

Thank you very much for your replies. Kudos to both of you for somehow =
interpreting the garbled ASCII art. It is the result of composing an =
"HTML format" email in Outlook '03.

I created a small subnet of /29 bits subnet mask for the DMZ and added =
the IPs of the machines in the DMZ to the outside interface of the =
firewall. I  used DNAT & restricted access to only the intended services =
on those machines. Everything worked well. Thank you for the prompt =
replies.

Best Regards,
Deepak Seshadri

  ----- Original Message -----=20
  From: Daniel Chemko=20
  To: Deepak Seshadri ; netfilter@lists.netfilter.org=20
  Cc: Imran Bashir ; Veena Rao ; Syed Amjad Ali ; Zia Ullah=20
  Sent: Monday, October 04, 2004 2:09 PM
  Subject: RE: DMZ Question


  You ASCII arts looks like death!

  In order to 'bind' any number of DNAT addresses to the firewall, you
  have two choices.

  1. Actually bind the IP address to the physical interface, such as:
  ip addr add w.x.y.z/24 dev eth1
  This will then get the DNAT from iptables.
  iptables -t nat -A PREROUTING --destination w.x.y.z -j DNAT --to
  ${My_NEW_ADDR}

  2. ProxyARP the IP address (http://www.sjdjweis.com/linux/proxyarp/):
  echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
  echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
  This will then get the DNAT from iptables.
  iptables -t nat -A PREROUTING --destination w.x.y.z -j DNAT --to
  ${My_NEW_ADDR}


  There is one to catch when doing this. If you have a single DNS source
  for external and internal machines, you'll have to resolve the =
machine's
  ip's the external IP. Netfilter will not work performing what I call
  reflective nat out of the box.

  I consider reflective nat to be when you want to connect to a machine =
on
  your subnet but under a different IP address.

  # You should have something like this line already
  iptables -t nat -A PREROUTING --destination w.x.y.z -j DNAT --to
  ${My_NEW_ADDR}

  # Allow traffic to bounce off the interface
  iptables -A FORWARD -o ${IF_DMZ} -o ${IF_DMZ} -j ACCEPT
  # Force the firewall to rewrite the source IP of the packet since
  conntrack refuses to allow SRC->FW->DST->SRC flows
  iptables -t nat -A POSTROUTING --destination ${My_NEW_ADDR} --source
  ${DMZ_NET}/${DMZ_MSK} -j SNAT --to ${FW_DMZ_IP}
