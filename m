From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: another iptables question
Date: Wed, 27 Nov 2002 13:41:39 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127184139.34206.qmail@web14506.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

still reading the HOWTO.

in the howto, it discusses about how internal machine access
webserver that is port forwarded to the same network. here

$INET_IP as the internet_IP

1.packet leaves $LAN_BOX to $INET_IP.
2.the packet reaches the firewall.
#my quesion: is the packet here looks like come from $INET_IP
the firewall machine (i.e SNAT'ed when it goes out to request
the webserver)?
3.the packet gets DNAT'ed,and all other requierd action are
taken,however,the packet is not SNAT'ed. so the same source IP
address is used on the packet.
# my question: what does it have to do with SNAT here? shouldn't
it see the source come from $INET_IP ?

then later the author has the solution like this:
iptables -t nat -A POSTROUTING -p tcp --dst $HTTP_IP --dport 80
-j SNAT  --to-source $LAN_IP

my quesion: the source change to $LAN_IP during SNAT. it seems
to me that when the webserver replies the request, it will reply
to the $LAN_IP. how does it  go back to the firewall machine so
it can be alterd?

sorry that is a lot questions. sincerely thanks for your help.




=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

