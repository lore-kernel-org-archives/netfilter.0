From: Geog Hofstetter <geggo@g3gg0.dyndns.org>
Subject: Re: [x] - Re: Flag SYN not necessarily state NEW?
Date: 16 Jun 2002 21:20:12 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024255213.6772.18.camel@geggo>
References: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan>
	<1024250696.6468.3.camel@geggo> 
	<200206161830.g5GIUlA30385@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206161830.g5GIUlA30385@Networker.rockstone.co.uk>
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
To: NetFilter Mailinglist <netfilter@lists.samba.org>

jep right, didnt think so far ;)

then i think this phenomen is neither explainable nor believeable.
if a connection is going to be established 
first SYN is sent 
SYN,ACK is received
and ACK will be answered
(TCP three-way handshake)

i dont know any case where TCP-connections are established(!)
in other way

__
Georg


    I would hope not - both the Source Port and the TCP ID number should be 
    different for the two connections, and since these are both included in the 
    LOG output from netfilter, the messages would not be identical...
    
    Antony.
    




