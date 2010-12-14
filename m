From: "iic1tls" <iic1tls@yahoo.com>
Subject: Bastion Firewall Host Redirect Question
Date: Tue, 14 Dec 2010 08:54:13 -0600
Message-ID: <000601cb9b9e$c6e81e30$54b85a90$@com>
Reply-To: <iic1tls@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1292338483; bh=nlGh5bApH/9/IIc3jYjKR8+7HwZQWlo0ehYAUvYAUEk=; h=X-Yahoo-Newman-Id:Received:X-Yahoo-SMTP:X-YMail-OSG:X-Yahoo-Newman-Property:Reply-To:From:To:Subject:Date:Organization:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language; b=Xw1afEU42iBhi5EGPYZgICsqk1atHI04SijpaqBnKqOHrJi9/uB1DPdDCY339b2nLspyeG91xjrfYPcJX+4Yx6ki4VlkoIN5QS3i1Lefp7dzby5jCdhn0Rq9SdAZ+e/xa6HEE/q0R0HNb+Tc/vgdafrEQW/bbaZr1QxPsv+TMSw=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear All,
 
Thank you for your time, and please reply to this message if you have any
suggestions.
 
Before posing my question, some background:
 
A firewall has been constructed using RH Fedora 13, Kernel 2.6.34.7-63, and
IPTables 1.4.7.  The firewall is a simple, twin adapter configuration, with
the external interface (eth0) facing the internet, and the other interface
(eth1) facing a small private network (single IP subnet).  The firewall is a
bastion host, meaning that the firewall host contains nothing but the
operating system, IPTables, and only those items needed to support operation
of the host itself.  The firewall does not run any other applications.
 
Contained within the private network is a web server.
 
Network:
Base Address: 149.10.10.0/24
Web Server: 149.10.10.25
Clients: located at various addresses on the subnet.
Firewall eth1 Address: 149.10.10.1
DNS Address: 149.10.10.2
 
QUESTION
Given that clients on the internal network can freely surf the internet: if
the clients select a specific web site (ie www.website.com), my goal is to
configure IPTables to instead redirect the client to the internal web
server.
 
- If the client web browser is going to surf www.website.com, then iptables
redirects the client to 149.10.10.25
- If the client web browser is going to surf any other website, then
iptables permits the client to forward to the internet.
 
***
 
I have attempted several iptables rules, including:
 
iptables -v -t nat -A PREROUTING --in-interface eth1 --dport 80 -d
www.website.com -j DNAT --to 149.10.10.25
 
However, this appears to have no effect.
 
Can you please recommend the rule I should be using to perform this feat?
 
THANK YOU

