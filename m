From: netfilter@buglecreek.com
Subject: Correct Chains to Apply Rules
Date: Tue, 17 May 2011 15:14:51 -0600
Message-ID: <1305666891.6262.1453014301@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:subject:date; s=smtpout; bh=WRFpAbYPwZvlYfzzlDe1NRzpFCk=; b=C3n1u0KSTpgN909/srH/eqxAgZpWj0xKeQ2nNh9jy83c2CAOILEnBOoFidZhOcEom/D4XZeGCpNbV43P0/JAYGXWEYA/GdA93MkF9AlZxbF3rPr1oJPdaAA3btVBE5KX3Wh2uSi9YlLn3Hun2bUKG9ZD50Gr6QBZGqxEXWQw0uk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

I'm trying to get a head start on a firewall/router setup and I'm unable
to test the rules since the hardware is not in place.  The simplified
initial setup will be:

Internet <----> eth0 Firewall eth1 <----> server network

My first thought on the initial setup was to allow all outbound traffic
on both interfaces and unrestricted access across both interfaces in the
FORWARD chain.   Rules will be applied to interface INPUT chains.  Both
interface (eth0 and eth1) will have a rule that allows INPUT
ESTABLISHED,RELATED.  

In the following scenario.  Someone makes a new HTTP request from the
Internet that is allowed inbound on eth0 and goes out of the eth1
interface to the HTTP server in the server network. 
The HTTP server in the server network sends the response to the original
requester.  

Does the response ever hit the INPUT chain of ETH1?  Or does it
immediately go to the FORWARD chain and out the OUTPUT chain of eth0.  

What I'm trying to accomplish is only allow certain hosts/protocols into
the server network and also only allow a very limited amount of traffic
out of the server network.  That way if anything gets compromised in the
server network I can attemp to contain it.  I'm trying to decide if
INPUT rules should be applied to ETH1 to contain traffic in the server
network or they should be applied to the OUTPUT chain on eth0.

Hope that makes sense. 
