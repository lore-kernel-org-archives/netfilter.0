From: Alex Chapman <ajchapman88@hotmail.co.uk>
Subject: nftables jump <chain> target invalid argument
Date: Thu, 14 Nov 2013 16:53:11 +0000
Message-ID: <DUB109-W87FE1E5161E5C42ED6593AE1F80@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

When attempting to use the jump target to forward traffic to a newly cr=
eated chain I get the following error:

[root@home nftables]# nft add rule filter forward ip daddr 9.9.9.9 jump=
 new
<cmdline>:1:1-49: Error: Could not process rule in batch: Invalid argum=
ent
add rule filter forward ip daddr 9.9.9.9 jump new
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


[root@home nftables]# nft list table filter
table ip filter {
=A0 =A0 =A0 =A0 chain input {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0type filter hook input priority 0;
=A0 =A0 =A0 =A0 }

=A0 =A0 =A0 =A0 chain forward {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0type filter hook forward priority 0;
=A0 =A0 =A0 =A0 }

=A0 =A0 =A0 =A0 chain output {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0type filter hook output priority 0;
=A0 =A0 =A0 =A0 }

=A0 =A0 =A0 =A0 chain new {
=A0 =A0 =A0 =A0 }
}


Is this the correct use of the command?=A0

Thanks! 		 	   		  