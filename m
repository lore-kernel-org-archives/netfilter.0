From: =?iso-8859-1?B?Sm9yZ2UgVW1h8WE=?= <jorgeaub@hotmail.com>
Subject: Web server access
Date: Mon, 14 Jul 2003 09:10:00 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-F121EveicGgej0000c435@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I have a LINUX box with a public ip. I need to use iptables to send all the=
=20
packages that come to the 80 port to my Web server in Windows. I am using=20
this chain:
iptables -t nat -A PREROUTING -p tcp -d $ipPUBLIC --dport 80 -j DNAT=20
--to-destination $ipWEBSERVER

I tried to access my web page from outside but does not work

I will appreciate your help
Thanks

_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
http://messenger.yupimsn.com/


