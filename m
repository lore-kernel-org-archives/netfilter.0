From: "Muenz, Manja" <M.Muenz@t-systems.com>
Subject: Need to mark filtered packets and retrieve this information in my
	 application....
Date: Wed, 11 Sep 2002 18:10:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <476F91F7CFDBD41182E000D0B7E7E6930280D025@U9JM7.mgb01.telekom.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Hello there,

I am working on suse 8.0.
I would like to use kernel packet filtering/iptables, but not to drop =
the files to which the filters apply, but to mark them. Then I would =
like to get all packets (the ones to which the filters applied and the =
others) in my own c++-application and differ them by the mark set =
before, to handle them differently.
Reading two days a lot of stuff about iptables, packet filtering, bpf =
and so on in the net I was not even able to identify, if I can do so. =
(I have to modify an already existing application, which uses kernel =
packet filtering with bpf and pcap, which until now only drops the =
packets to which the filters applies  - and I have to do it quick :-( =
...)

Can somebody please answer me:
1. Can I do it anyway?
2. If it is possible, how can I do it?

Thank you very much
Manja M=FCnz

