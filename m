From: Stephen Johnson <stephen.johnson@arkansas.gov>
Subject: Problems with trying to use the TEE target
Date: Thu, 07 Apr 2011 12:59:50 -0500
Message-ID: <1302199190.16650.23.camel@sjohnson.state.ar.us>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Greeting,

I trying to use the TEE target but I keep getting the errors even using
the example commandi on the ipxt_TEE man page.

# iptables =E2=88=92t mangle =E2=88=92A PREROUTING =E2=88=92i eth0 =E2=88=
=92j TEE =E2=88=92=E2=88=92gateway 1.1.1.1
iptables: No chain/target/match by that name.

It doesn't matter what table / filter that I specify the command. the
same 'No chain/target/match by that name' error occurs. I'm current
using iptables-1.4.10 that I've compiled and installed on the server.
The linux kernel is 2.6.32.

I've tested my iptables installation using some other rules sets that I
used in the past using SNAT, DNAT, MASQUERADE, custom rules, and basic
filtering. Those rule sets work just fine. It's only TEE I'm having
rouble with.

Google searchs show other people having the same issue, but no answers
to their posts.
--=20
Stephen L Johnson  <stephen.johnson@arkansas.gov>
Unix Systems Administrator / DNS Hostmaster
Department of Information Systems
State of Arkansas
501-682-4339


