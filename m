From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Controlling bandwith rate on port 80
Date: Wed, 12 Jun 2002 06:22:54 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c21185$c4732c00$7b0010ac@dynamicaccess.lan>
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

yes it can be done with IPTables just not alone ..

you will need to complie your kernel with the IPTABLES MARK / TOS / U32
classifiers / CBQ  ect  set to M..

now that we have the support we can use

a Token Bucket Filter or CBQ  to limit the packet rate Per interface both in
up or down

to do this correcty you will need to set a ToS MARK value on all PORT 80
traffic

leaving the BOX (or however you need it) with IPTABLES the

in your Pcaket Shaping CBQ script you can search for those marked packets
and stick them in a Low Priorty Que

or a QUE that has a set amount of bandwidth allocation ect ...

If you know nothing of these go Search for Advanced Routing & TOS / MARK as
well as CBQ & TBF

have Fun cause it can be a pain in the ass ...

If you need more help just send me an Email . .. :D

See yas .. :D


