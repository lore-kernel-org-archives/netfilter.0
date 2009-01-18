From: Peter Renzland <peter@dancing.org>
Subject: CONNLIMIT Questions
Date: Sun, 18 Jan 2009 13:32:20 -0500
Message-ID: <55F56AFD-736E-4FBB-9F08-B4A6A3393140@dancing.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

What I want to do is limit the total number of (mostly) outgoing  
(mostly UDP) connection (attempts) by LAN IP.  This is because of out- 
of-control BT (etc.) configurations and clients that will try to set  
up thousands of connections in a few seconds, almost all of which will  
fail and time out.  With a dozen LAN users doing this simultaneously,  
the router is toast.


I have seen the following two rules suggested frequently:


iptables -I FORWARD -p tcp --syn -m iprange --src-range  
192.168.0.100-192.168.0.199 -m connlimit --connlimit-above 100 -j DROP

iptables -I FORWARD -p ! tcp -m iprange --src-range  
192.168.0.100-192.168.0.199 -m connlimit --connlimit-above 50 -j DROP


My questions:

1. Is REJECT any better than DROP?  (Will anything or anyone actually  
get the reject message and learn anything from it?)

2. Is the "--syn" necessary?  The manual says:

     "--syn
         Only match TCP packets with the SYN bit set and the ACK,RST  
and FIN bits cleared. Such packets are used to request TCP connection  
initiation; for example, blocking such packets coming in an interface  
will prevent incoming TCP connections, but outgoing TCP connections  
will be unaffected"

      When limiting connections with CONNLIMIT, can I not rely on  
CONNTRACK's logic to determine that a new connection is about to be  
tracked?  Why should I have to duplicate part of this effort?  Does  
the logic of the text of that paragraph accurately reflect the  
program's logic?


3. Is there not a single rule that will limit connections regardless  
of protocol?  Why does:

     iptables -I FORWARD  -m iprange --src-range  
192.168.0.100-192.168.0.199 -m connlimit --connlimit-above 50 -j DROP

     fail with "Invalid argument"?

     This man page ( http://linux.die.net/man/8/iptables ) states:

    "connlimit
	Allows you to restrict the number of parallel TCP connections to a  
server per client IP address (or address block)."


     And all examples are for TCP, and all specify "--syn".


     So, is "! tcp" just a kludge to get around a "tcp-only" design  
limitation?  Or is there some "good" reason? :-)


     (After all, the concept of connection in connection-tracking is  
much broader than the concept of connection in TCP.  What might I be  
missing? :-)


4. Here is the BIG question:

     The manual says: "restrict the number of parallel TCP connections  
to a server".

     But that is not at all what I want to do.   I want to restrict  
the number of greatly *divergent* connections to many, many different  
servers.



Perhaps there is a better (effective) way to limit connection attempts  
by LAN IP?
In any direction and for any protocol.


Thanks much!

Peter Renzland
