From: "=?iso-8859-1?Q?jean-michel.caricand?=" <jean-michel.caricand@laposte.net>
Subject: =?iso-8859-1?Q?Fw:Problems_with_netmask?=
Date: Mon,  8 Jul 2002 17:31:23 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <GYXSGB$C3A8D4997AFEF803EEFEFC5E54C16CFF@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.samba.org

---------- Debut du message initial -----------

De     : "jean-michel.caricand" <jean-
michel.caricand@laposte.net>
A      : netfilter-request@lists.samba.org
Copies : 
Date   : Mon,  8 Jul 2002 15:53:28 +0200
Objet  : Problems with netmask

Hello,

I have a local network with 255.255.254.0 netmask. My firewall 
have IP 10.0.2.130. 

I configure my firewall for drop the ping from a station with 
IP 10.0.2.2 with only one line :

iptables -A INPUT -i eth0 -s 10.0.02.2 -p icmp -j DROP 

My station receive an response from the serveur when i use the 
command ping 10.0.2.130 !!!!

When i use :

iptables -A OUPUT -o eth0 -d 10.0.02.2 -p icmp -j DROP 

Its work fine. I never receive an pong

Why ?

Acc=E9dez au courrier =E9lectronique de La Poste : 
www.laposte.net ; 3615 LAPOSTENET (0,13 =80/mn) ; t=E9l : 08 92 68 
13 50 (0,34=80/mn)"




Acc=E9dez au courrier =E9lectronique de La Poste : www.laposte.net ; 3615 LAPOSTENET (0,13 =80/mn) ; t=E9l : 08 92 68 13 50 (0,34=80/mn)"




