From: "John L. Magee" <jlmagee@mageenet.net>
Subject: Passive FTP Client fails connecting to Server behind IPTABLES Firewall
Date: Sat, 29 Dec 2007 16:52:11 -0500
Message-ID: <91CBD7F22CBCE7458D3E7A71C81B07C8485882@mnetmx1.adamapps.host>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

This is a better subject description than the previous one. Same
configuration.
 
TCPDUMP analysis shows that the response from the server to the client
telling it to go to passive mode on port x is retaining the INSIDE
address of the server in the command packet and the client therefore
tries to initiate the data connection directly to the inside address
instead of the outside one.
 
I do see all kinds of related commentary while googling but none that
have any solutions for me. If ip_contrack_ftp and ip_nat_ftp are
supposed to manage this, they are not.
 
Any assistance would be greatly appreciated.
 
 
 
 
John L Magee

