From: alexander.swann@synetics.fr
Subject: =?iso-8859-1?Q?R=E9f=2E_=3A_DNAT=2FPort-Forwarding_Problem?=
Date: Sun, 7 Jul 2002 11:41:30 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <OF06AFFDA2.2C243997-ONC1256BEF.0034F249-C1256BEF.00355D5C@synetics.fr>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


# port forwarding
$IPTABLES -t nat -A PREROUTING -p tcp -i $EXT_IF --dport 80 -j DNAT --to
192.168.100.5:80

==> [...]
==> IPPUvirtun=62.23.87.xx  #public address on virtual Interface eth1:1
==> [...]
==> $PATH -t nat -A PREROUTING -p tcp -d $IPPUvirtun --dport 80 -j DNAT
--to $SRVmailkmsy:80

==> This works fine for me :)

Best regards



