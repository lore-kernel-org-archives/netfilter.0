From: Blizzards <blizzards@libero.it>
Subject: Re: DROP Fin Scan
Date: Thu, 12 Dec 2002 16:25:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF8AA68.3040900@libero.it>
References: <20021124093933.24186.71076.Mailman@kashyyyk> <1039703255.3df89cd74ff10@zigzag.cantine.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dade <mailing@cantine.org>
Cc: netfilter@lists.netfilter.org

The idea behind the FIN scan, is not based on a NEW connection  (only 
pachet with the SYN bit set and ACK,RST,FIN cleared can initiate a new 
connection), but in sending an RST/FIN to a server to probe ports.
Closed ports reply to this CLEAR CONNECT FIN bit set packet with a RST 
bit set, while open port must ignore
the packet (this works on a unix TCP/IP stack).
FIN bits is sended by the client to server
server reply with ack
client close connect and reply with ack
server now send FIN and close connection
client receive final FIN and close all.
RST bit set produce an immediate closing of connection on both side.
In my opinion the 1st rule is exact:

iptables -A INPUT -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP

Bye.
G.




>: 
>
>Hi, 
>I'd like to block all FIN SCAN type. In Internet I find the following method: 
>
>iptables -A INPUT -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP 
>
>but for me is better to write: 
>
>iptables -A FORWARD -m state -state NEW -p tcp --tcp-flags FIN FIN -j DROP 
>
>that means blocking all packets with flag FIN active regarding only packets 
>belonging to new TCP connections. 
>Are you agree? 
>Thanks in advance, 
>Davide
>  
>



