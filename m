From: Jay Foster <jay@systech.com>
Subject: iptables fails to NAT some packets
Date: Thu, 10 Oct 2013 15:56:27 -0700
Message-ID: <5257309B.8030204@systech.com>
Reply-To: jay@systech.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a gateway application which I am using iptables to NAT from a LAN 
interface to a WAN interface (linux 3.2.6).  This mostly works well, 
except that I sometimes see (via wireshark) IP packets being sent out 
the WAN interface that originated from the LAN interface that iptables 
fails to apply NAT.

These packets seem to usually be FIN, FIN/ACK, or RST packets.  I 
suspect that these are for IP connections from the device connected to 
the LAN interface that were setup prior to being connected to the 
gateway on which I am running iptables.  After some time, I think the 
application on the connected device decides to close these connections 
(FIN), but iptables fails to NAT these packets.  Why?

 From the iptables man page:

               nat:
                   This table is consulted when a packet  that  creates  
a  new
                   connection  is encountered.  It consists of three 
built-ins:
                   PREROUTING (for altering packets as soon as they  
come  in),
                   OUTPUT  (for altering locally-generated packets 
before rout-
                   ing), and POSTROUTING (for  altering  packets  as  
they  are
                   about to go out).

I'm concerned about the statement that says, "when a packet that creates 
a new connection is encountered".  Since the SYN packet for the problem 
FIN,RST packets was not seen by iptables, does this mean that iptables 
will not NAT the FIN packet?  This would seem wrong to me.

Jay

