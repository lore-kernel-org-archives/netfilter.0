From: "Andrew Magnus" <xanadian9@hotmail.com>
Subject: Link redundance question
Date: Mon, 11 Nov 2002 01:18:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F91A4h4dMDbl71Ri4wX0000614a@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello.

I have a question about link redundancy (if it's possible).  I have a 
network set up like in the diagram below:

                            Hi-speed WAN
                                 |
                                 |
        Dialup (backup)---- Masquerading
                              "router"
                                 |
                                 |
                            Internal net

What I'm trying to do is this:  if the high speed connection goes down 
(which it seems to do frequently :-P ) I want iptables to default to the 
dialup connection.  And vice versa (I have iptables set up to use a 
particular link for a particular service).  Is this possible?  And if it is 
possible, how do I do it/where do I look to learn/etc.  Thanks.


_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


