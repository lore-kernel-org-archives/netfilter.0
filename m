From: "Scott Ainslie" <scott_ainslie@hotmail.com>
Subject: PREROUTING exclude
Date: Thu, 05 Sep 2002 12:50:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F16XvpFVjCRGryWtIIZ000009c9@hotmail.com>
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

I want the following rule to work for all machines on my subnet except for 
192.168.0.4. How do I exclude this single machine from this rule?

/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp \
-s 192.168.0.0/24 \
-d 0/0 --dport 80 \
-j DNAT --to 192.168.0.4:3128

_________________________________________________________________
Send and receive Hotmail on your mobile device: http://mobile.msn.com


