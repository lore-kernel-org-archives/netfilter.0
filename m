From: "=?iso-8859-1?Q?yves.metivier?=" <yves.metivier@laposte.net>
Subject: =?iso-8859-1?Q?H323_and_Traffic_Control__?=
Date: Fri, 25 Oct 2002 13:36:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <H4JC9N$8B17FEF3457390EDE1EF6BC9A0A4266D@laposte.net>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?Q?netfilter?= <netfilter@lists.netfilter.org>

Hi!

I recently installed h323 netfilter extension on my home
firewall/gateway and it works fine! Thanks!

But I have a problem with traffic control :
I want to give highest priority to real time traffic, like 
h323.

I use HTB queuing discipline with four different priority 
classes. I use packet marking in netfilter through the mangle 
table and fw mark option in "tc filter add ..." to send 
packets in one of the four classes depending on the mark

I was expecting that h323 netfilter module should mark all 
h323 traffic, including RTP and RTCP UDP packets, but it seems 
that it only marks packets from known ports (those explicitely 
declared in iptables), and not UDP related packets.

Is my analyse right?

Thanks in advance for any answer.

Yves

 


Acc=E9dez au courrier =E9lectronique de La Poste : www.laposte.net ; 3615 LAPOSTENET (0,13 =80/mn) ; t=E9l : 08 92 68 13 50 (0,34=80/mn)"




