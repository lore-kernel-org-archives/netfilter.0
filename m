From: =?iso-2022-jp?B?GyRCJFskKBsoQiAbJEIkaiRzGyhC?= <hoerin@hotmail.com>
Subject: about fragment packet
Date: Sat, 24 Jan 2004 22:58:11 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law15-F25ueolj8Jecd00011e8e@hotmail.com>
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
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

There is a question about the filtering method of fragment pachet using 
ip6tables.

A and B prepare two PCs, the command of ip6tables of the following [ B ] is 
struck, 
and 4000 bytes of UDP packet (address port number 1025) is sent from A to 
B.

(PC on B) %ip6tables -A INPUT -p udp -m frag --dport 1025 -j DROP

In this environment, since MTU was 1500 bytes, the packet was 
fragmentation-ized by 
three, and all the packets reached and carried out to B.

Then, although it is a question, since there is information on a port 
number in the 
first fragmentation-ized packet, although it thinks that it is filtered and 
two of 
succession pass, why is it?

Is it the specification which cannot use the frag option and the port 
option together?

_________________________________________________________________
友達と24時間ホットライン「MSN メッセンジャー」、今すぐダウンロード！  
http://messenger.msn.co.jp 


