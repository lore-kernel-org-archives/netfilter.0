From: Tony Clayton <tony-netfilter@enfusion-group.com>
Subject: lifecycle of a packet
Date: Thu,  9 Jan 2003 17:54:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042152892.3e1dfdbc6f5d1@webmail.enfusion-group.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org


I've been reading the various docs linked to from netfilter.org, hoping
to figure out the exact order in which a packet traverses the various
tables and chains as it passes through the network stack.  

Unfortunately, I couldn't find a definative resource that contained this
information, so I decided to figure it out myself.

I build a quick script to insert LOG rules into every chain of every
table, so that I could log the order in which the tables and chains are
traversed.

Here are my findings, using the three test cases below:

---
TEST A:
Sending http request from masqueraded client, through firewall, to
external box

Request from client

   1. mangle: PREROUTING
   2. nat: PREROUTING (first packet only)
   3. mangle: FORWARD
   4. filter: FORWARD
   5. mangle: POSTROUTING
   6. nat: POSTROUTING (first packet only)

Reply from external box

   1. mangle: PREROUTING
   2. mangle: FORWARD
   3. filter: FORWARD
   4. mangle: POSTROUTING

TEST B
Sending http request from masqueraded client to firewall

Request from client

   1. mangle: PREROUTING
   2. nat: PREROUTING (first packet only)
   3. mangle: INPUT
   4. filter: INPUT

Reply from firewall

   1. mangle: OUTPUT
   2. filter: OUTPUT
   3. mangle: POSTROUTING

TEST C
Sending http request from firewall to external box:

Request from firewall

   1. mangle: OUTPUT
   2. nat: OUTPUT (first packet only)
   3. filter: OUTPUT
   4. mangle: POSTROUTING
   5. nat: POSTROUTING (first packet only)

Reply from external box

   1. mangle: PREROUTING
   2. mangle: INPUT
   3. filter: INPUT

---

This is quite interesting, and not at all what I was expecting based on
what I'd read.

I have a list of questions about this behaviour, keeping in mind that
I'm fairly new to iptables/netfilter:

1. Why does only the first packet for a TCP/IP connection seem to pass
through the nat table?  Does connection tracking take over if the packet
is (ESTABLISHED,RELATED) and work some magic under the covers?

2. Why do both OUTPUT and POSTROUTING chains get traversed for packets
that the firewall sends out?  Is this useful at all?

3. Most of the documents I looked at were fairly old.  Is there a
somewhat recent document that perhaps might benefit from including these
 tests?

thanks,

Tony




