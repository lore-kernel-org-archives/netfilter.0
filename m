From: <hard__ware@hotmail.com>
Subject: basics
Date: Mon, 28 Apr 2003 12:55:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-OE64RIME72AC1k000040ea@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: "lists.netfilter" <netfilter@lists.netfilter.org>

>1. If in my system runs only deamons that are above on the list, is this
nessecery to
>  block unussed ports?
>2. Is it wise to block all ports above  REGISTERED PORT NUMBERS ( above
> 1000 port ), when in system runs http server that answer to client
>  from global net on this ports, and proxy server that answer to the
>  local clients on this ports ???

1.) For security reasons is better to only allow incoming (via WAN) on
Registered Ports that are needed [ 0-1023 ]
so any ports not needed within this range either Block or Reject .

2.) Allot of services such as FTP Passive Mode Transfers require that you
have Incoming Ports [1024-32768] about that
anyway Not Open but then not blocked or filtered either ... Thats were
conntrack ESTABLISHED & RELATED rules come in.
 Established is where the conntracker has seen data already go both ways and
if it has will do what you have set in its -j Target.
 Related takes care of the rest of the stuff that conntracker doesnt know
how to handle, e.g, a incoming icmp packet
is checked to see weather it is 'Related' to another connection such as a
ICMP message for a Host Unreachable or  something like that. It also takes
care of other helper such as FTP Transfer data that was related to a Ftp
Connection
same for IRC and DCC Transfers ...

Alex Nee
Hard__warE

