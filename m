From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: block msn
Date: Fri, 18 Jul 2003 18:55:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010501c34d4d$5a728120$0401000a@sterenborg.info>
References: <3F1538A4.9000702@sat.com.py>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3F1538A4.9000702@sat.com.py>
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

> I`ve got this rulset but It doesn`t work what else do I need to add?
> All the windows machine work msn, just on linux doesn`t
> Any suggetions ?

With these rules I'm successfully blocking MSN usage.

Iptables :

/usr/local/sbin/iptables -A FORWARD -p tcp --dport 1863 -j REJECT
--reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.104.20 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.110.35 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.110.41 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.110.43 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.110.48 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.110.49 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.46.110.254 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.68.171.247 -p tcp --dport 80
-j REJECT --reject-with tcp-reset
/usr/local/sbin/iptables -A FORWARD -d 207.68.178.239 -p tcp --dport 80
-j REJECT --reject-with tcp-reset

Squid :

# Deny MSN access to servers
acl MSN_Servers dst 207.46.104.20
acl MSN_Servers dst 207.46.110.35
acl MSN_Servers dst 207.46.110.41
acl MSN_Servers dst 207.46.110.43
acl MSN_Servers dst 207.46.110.48
acl MSN_Servers dst 207.46.110.49
acl MSN_Servers dst 207.46.110.254
acl MSN_Servers dst 207.68.171.247
acl MSN_Servers dst 207.68.178.239
http_access deny MSN_Servers

I don't know if the serverlist is complete, but at the moment it works
for me.


--
Rob


