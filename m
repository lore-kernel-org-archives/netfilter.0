From: afshin lamei <afshinlamei@gmail.com>
Subject: psd match false positives?
Date: Mon, 3 Oct 2005 17:45:53 +0330
Message-ID: <3115d56e05100307153c99ebfb@mail.gmail.com>
Reply-To: afshin lamei <afshinlamei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi all,
I am using the "port scan match" with its default values, my rules are like
this:
iptables -A INPUT -m psd -j LOG --log-prefix "port scan:" // log the port
scan
iptables -A INPUT -m psd -j DROP // Drop it silently

one of my DNS servers is 4.2.2.4 <http://4.2.2.4> , and I'm seeing these
logs, which say the 4.2.2.4 <http://4.2.2.4> is port scanning my box
(external interface: 192.168.100.151 <http://192.168.100.151>) !!

Oct 3 17:23:35 kernel: Port scan:IN=3Deth0 OUT=3D SRC=3D4.2.2.4 <http://4.2=
.2.4>DST=3D
192.168.100.151 <http://192.168.100.151> LEN=3D8 PROTO=3DUDP SPT=3D53 DPT=
=3D32769
Oct 3 17:23:35 kernel: Port scan:IN=3Deth0 OUT=3D SRC=3D4.2.2.4 <http://4.2=
.2.4>DST=3D
192.168.100.151 <http://192.168.100.151> LEN=3D1 PROTO=3DUDP SPT=3D53 DPT=
=3D32761
Oct 3 17:23:35 kernel: Port scan:IN=3Deth0 OUT=3D SRC=3D4.2.2.4 <http://4.2=
.2.4>DST=3D
192.168.100.151 <http://192.168.100.151> LEN=3D1 PROTO=3DUDP SPT=3D53 DPT=
=3D32773
Oct 3 17:23:35 kernel: Port scan:IN=3Deth0 OUT=3D SRC=3D4.2.2.4 <http://4.2=
.2.4>DST=3D
192.168.100.151 <http://192.168.100.151> LEN=3D1 PROTO=3DUDP SPT=3D53 DPT=
=3D32775
Oct 3 17:23:35 kernel: Port scan:IN=3Deth0 OUT=3D SRC=3D4.2.2.4 <http://4.2=
.2.4>DST=3D
192.168.100.151 <http://192.168.100.151> LEN=3D1 PROTO=3DUDP SPT=3D53 DPT=
=3D32780

It seems to be a false positive, isn't it? if so, dropping them will cause
problems, so what should i do?
regards,
afshin
