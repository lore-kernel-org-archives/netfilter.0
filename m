From: "tirexx" <tirexx@mail.ru>
Subject: -m state ESTABLISHED, NEW etc...
Date: Thu, 30 May 2002 17:27:34 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <004401c207e6$249c22c0$3401000a@ryanchenko>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter@lists.samba.org

Hi all

TCP connection flow by this scenario
Can someone explain me where pass borders of state ESTABLISHED, NEW.

1-> SYN
2<- SYN ACK
3-> ACK
connected
....
4-> ACK
5<- ACK
....
6-> FIN
7<- ACK
8<- FIN
9-> ACK
closed

I think so:
1,2,3 NEW
2,3,4,5,6,7,8,9 ESTABLISHED
2,3,4,5,6,7,8,9 RELATED

i`m wrong?


with this rules outgoing connect work
incomming connect not work
this demonstrate 2,3,4,5,6,7,8,9 = ESTABLISHED

iptables -A FORWARD -o eth_external -i eth_internal -p tcp -d
x.x.x.x --dport x -j ACCEPT
iptables -A FORWARD -i eth_external -o eth_internal -p tcp -s
x.x.x.x --sport x -m state --state ESTABLISHED -j ACCEPT





