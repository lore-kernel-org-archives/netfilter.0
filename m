From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Matching HTTP/FTP packets
Date: Wed, 12 Jun 2002 13:30:55 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <001e01c211c1$8f758840$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
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

so what you require is to actually match Layer 7 Data       (on the OSI
Layer)

maybee what you want to do can be Piped through a Squid Transparent Proxy

which allows you to match by a HTTP/FTP address and Data so then you can
maybee

do something with it ..

help me out here what do you want to do with this data once you have found
it ???


