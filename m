From: "Halasan . Harvey" <harvey@hnu.edu.ph>
Subject: RE: block yahoo messenger
Date: Fri, 28 Feb 2003 08:48:22 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E18ofpy-0007iE-00@kashyyyk.netfilter.org>
Reply-To: harvey@hnu.edu.ph
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>Maybe it's quite rude to block 4 /24 nets, but Messenger kept >connecting
>in these ranges and on different ports (5050, 23, 80) so I just did >?this
>:
>
>iptables -A FORWARD -d 216.136.223.0/24 -j REJECT --reject-with
>tcp-reset
>iptables -A FORWARD -d 216.136.224.0/24 -j REJECT --reject-with
>tcp-reset
>iptables -A FORWARD -d 216.136.227.0/24 -j REJECT --reject-with
>tcp-reset
>iptables -A FORWARD -d 216.136.233.0/24 -j REJECT --reject-with
>tcp-reset
>
>Of course you are welcome to find out exactly what servers Messenger
>using to block them individually ; I didn't take the time to do that.
>

I did!! But i think its not complete yet ... pls mail me if theres more :)

# Yahoo Messenger Servers? :^D
/sbin/iptables -A OUTGOING -d 63.216.136.22	-j DROP
/sbin/iptables -A OUTGOING -d 66.135.224.142	-j DROP
/sbin/iptables -A OUTGOING -d 66.136.175.132	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.168.105	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.172.117	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.173.76	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.173.77	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.173.78	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.173.203	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.175.128	-j DROP
/sbin/iptables -A OUTGOING -d 66.163.178.78	-j DROP
/sbin/iptables -A OUTGOING -d 204.71.200.36	-j DROP
/sbin/iptables -A OUTGOING -d 204.71.200.37	-j DROP
/sbin/iptables -A OUTGOING -d 204.71.201.134	-j DROP
/sbin/iptables -A OUTGOING -d 204.71.201.141	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.173.172	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.173.179	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.132	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.142	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.143	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.144	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.145	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.145	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.175.226	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.224.134	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.224.142	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.224.213	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.224.213	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.224.214	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.225.12	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.226.117	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.226.118	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.226.209	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.226.210	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.227.168	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.129	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.130	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.131	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.133	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.135	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.148	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.151	-j DROP
/sbin/iptables -A OUTGOING -d 216.136.233.152	-j DROP

harvey

