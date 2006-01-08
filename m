From: bright true <brighttrue@gmail.com>
Subject: block + kill connections
Date: Sun, 8 Jan 2006 23:44:39 +0200
Message-ID: <3b29fb790601081344me985167p9c06cf286126ffdb@mail.gmail.com>
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

Hello ,

How to block plus kill all currently opened connections from specific ip ad=
dress

on all ports .

i tryed using :

iptables -I INPUT -s 1.2.3.4 -j DROP

but seems to be it doesn't kill the active connections , it works only for =
new

incoming connections

any help ?

Thanks

