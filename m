From: Wolfgang Pichler <madmin@dialog-telekom.at>
Subject: backroute problem
Date: 23 Jul 2003 20:03:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058990585.1957.63.camel@defiant.dialog>
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
To: netfilter@lists.netfilter.org

hi all,

we have got new ip addresses - the old one's still exists so that i can
migrate them to the new ones.

the old ip's are directly assigned to the web/mail server (i know that
this isn't good - but i havn't had a fireall at this time) - now i have
a seperate firewall which has the new ip's assigned to it.

Now i'd like to change the dns entries so that the traffic goes over the
new ip's (a 4 MBit line ;-) ) - the problem i have is:

when a packet on the new ip comes then it gets prerouted by the firewall
to the webserver - the webserver gets the packet with the original
source address - now to webserver wants to answer to the packet - but
becuase of the old ip's the webserver have a default route with the old
ip and try's to route the packet over the old gateway - and not back to
the firewall... You know - that can't work.

I am now searching for a solution for this problem. Can netfilter help
me with this problem - or do i have to use iproute (i havn't ever done
something with iproute) help me ?

Can i mark the packet's so the the webserver can send them back in the
right direction ?

mfG
Wolfi





