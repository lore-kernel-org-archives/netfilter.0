From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Nat OUTPUT chain
Date: Sun, 16 Jun 2002 12:30:46 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c214dd$d27b0240$7b0010ac@dynamicaccess.lan>
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

>Why do you DROP in the nat table instead of the filter table ?
>
>
>Antony.

Good Question ...

1. im very Young and i luv nat and seeing what it can do.. :-D , would also
eventually like to gain work in Internet Sercurity / Iptbales / Zebra /
Bridged / Gated / iproute2 / ipchains (yay) / TC  TBF , CBQ , ect ect .

.2 actually i have every single one Policy's set to DROP for all of the
filter & nat chains.. :-D
is there something wrong with that, ?  Yer but you have to check the logs
alot from the Drop & Log end of chain
per chain Rules i have (they all have a different prefix applies ie "Nat
Ouput")
so you can add more rules ...  {:?/]

P.s. and about the MIRROR converstation

i need to set a way so all data on a Given Proto / IP gets MIRRORed but some
how Dnat it
so it goes to a Honney Pot for Logging and decide to take Action or not ..
:-D

(this is nearlly all working except the fact that the Packet / Traffic
accounting is not being properly matched ?? )






