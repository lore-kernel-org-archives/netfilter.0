From: "Simpson, Doug" <dsimpson@friedmancorp.com>
Subject: RE: ssh
Date: Tue, 14 Jan 2003 15:28:24 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20ED00AA0BC135449469D6EF0AE79C971046@ozlan.fcdomain.net>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

whoops - forgot this is a dual homed computer and I am opening the eth0 to
the outside world for ssh.
I did find this - 
iptables -A INPUT -p tcp --syn --destination-port 22 -j ACCEPT
iptables -A INPUT -p tcp --syn -j DROP
this confuses me because of the "DROP" and the "--syn"
Thanks,
Doug

-----Original Message-----
From: Simpson, Doug 
Sent: Tuesday, January 14, 2003 1:59 PM
To: 'netfilter@lists.netfilter.org'
Subject: ssh


I have acomputer I want to ssh to from the internet.  What is the IPTABLES
command to open this port?
Thanks,
Doug

