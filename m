From: Jan Humme <jan.humme@xs4all.nl>
Subject: fragmentation flag
Date: Wed, 10 Jul 2002 21:42:25 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207102142250F.04513@Lms>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I am not sure about the fragmentation option: -f.

I understand that this flag is not needed "if you use connection tracking".

But what exactly is meant by "if you use connection tracking" ? Does it mean: 
"if the ip_conntrack module is loaded", or does it mean: "if you have rules 
using NEW, ESTABLISHED etc" ?

And is it correct that, in that case, all fragmented packets will be 
unfragmented before they hit any chains, so I will not see any unfragmented 
packets anyway?

And in case I do need to use the -f option, then in which chains and in which 
rules?

BTW: I am using iptables v1.2.1a.

Jan Humme.

