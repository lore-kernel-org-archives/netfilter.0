From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: mail injection protocol port
Date: Tue, 04 Feb 2003 09:04:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3FE4A1.2080602@shortcircuit.dyndns.org>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Question all.

~  I'm defining a rule set for my machine. Most services work fine, but 
I use tmda-ofmipd to send email, and when I implement my firerwall rules 
tmda-ofmipd stops working. It connects fine, but then it won't properly 
recieve and forward the messages to the smtp server. I don't know whats 
up. I believe that it tried to send mail to localhost:25 and I have all 
localhost traffic allowed. Here's my rules. Any help is appreciated!

- --- Dan
$IPT -P INPUT DROP
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD DROP

# step 3 FLUSH THE TABLES
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -t nat -F PREROUTING
$IPT -t nat -F POSTROUTING
$IPT -t nat -F OUTPUT

# setp 4 - setup rules
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -p tcp -i eth0 -m multiport --dports 
telnet,ssh,domain,nntp,ntp,printer,pop3,imap,http,https,netbios-ssn,netbios-dgm 
-j ACCEPT
$IPT -A INPUT -p tcp -m multiport --dports 
netbios-ssn,netbios-dgm,netbios-ns,4000,pgpkeyserver,mysql,sunrpc,rndc,8027 
-j ACCEPT
$IPT -A INPUT -p udp -i eth0 -m multiport --dports 
domain,ntp,route,137,138,139 -j ACCEPT

$IPT -A FORWARD -i eth0 -j ACCEPT
$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQE+P+SgxQEzeXtVwzoRApQWAJ4iRpXMLZZ1OPQHgwfV0YoX3kpEzQCgo0s+
YnWj4U5X2OhnwcQPWN2Vbag=
=46FY
-----END PGP SIGNATURE-----


