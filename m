From: Alok Shukla <alokshukla@yahoo.com>
Subject: HELP : How to group IP addresses by refering to them as a single name ?
Date: Thu, 19 Sep 2002 00:45:55 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020919074555.18679.qmail@web40202.mail.yahoo.com>
References: <200209041320.g84DKjv31137@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209041320.g84DKjv31137@vulcan.rissington.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>

HI,

I run a College Laboratory with two rooms for the
whole labaratory
I have given a static IP for each of the computers
from 192.168.0.1 to 192.168.0.254.

1. My Lab 1 has IP from 192.198.0.11 to 192.168.0.50
and Lab 2 has IP from 192.168.0.51 to 192.168.0.90

2. I run a Redhat Linux 7.3 Server that acts as a
masquerading server, DNS Server and a Web Server.Its
IP is 192.168.0.1

3. I also have Windows NT Server for running a domain
over the whole network.Its IP is 192.168.0.2

4. My each of the client machine has Windows XP
Professional running which acts as a CLient for WIN NT
Domain.Each computer has gateway setting as for Red
Hat Linux 7.3 machine.

5. My Iptables scripts allows everbody to access the
net through following command:-

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d
any/0 -j MASQUERADE

Now my problem :-

I want to have a set of rules so that i can group Lab
1 computers in one group and Lab 2 computers in
another group. In this I want to able to shutdown the
Internet facility by stopping its masquerading as a
whole by refering as a single name.

Like something like :-

iptables -t nat -D POSTROUTING -s "LAB1" -d any/0 -J
MASQUERADE

or rather

iptables -t nat -D POSTROUTING -s 192.168.0.11-50  -d
any/0 -J MASQUERADE

Is short i want to create groups and i want to
administer network access by refering to group of
computers rather than their respective IP addresses..
SOmething like name addressing or rather multicasting 
etc...or whatever

Alok Shukla

__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

