From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: portforward of port 80 not working
Date: Sat, 01 Feb 2003 20:23:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20030201201121.02dcdeb0@linda.kadnet.dom>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi

I have a problem forwarding port 80. I can forward any ofter port, like 81 
or 8080. I juse
iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 80 -j DNAT --to 
172.16.1.7:80

to forward with, eth2 being my wan-interface and 172.16.1.7 my webserver. 
It doesn't work. I can see in my apache log fil on the webser that the 
request gets there, but nothing comes back.

If I try iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 8080 
-j DNAT --to 172.16.1.7:80 and adds :8080 to my url, it works. I have - 
ofcourse - disabled the webserver on my firewall host. I had it fixed one 
time, but for other reasons I had to rerun my iptables-script and since 
then it hasen't worked, that is why I think that it is an iptabels problem, 
eventhough I can't see what should make this happen.

I have tried numerous differrent scripts to get this to work, even

iptables -A INPUT -j ACCEPT
iptables -A FORWARD -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 80 -j DNAT --to 
172.16.1.7:80

just to try it - and that too didn't work.

I am running kernel 2.4.19-pre9 and iptabels 1.2.7 on a redhat 7.3

Hope somebody have an idea, and thanks in advance.

/Rasmus


