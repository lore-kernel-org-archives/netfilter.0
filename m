From: Michele Codutti <michele.codutti@uniud.it>
Subject: Conntrackd and UDP
Date: Tue, 24 Feb 2009 09:37:50 +0100
Message-ID: <1235464670.9964.13.camel@menhir.cc.uniud.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I'm using conntrackd in a ha clustered firewall. Since the
initial setup I configured conntrackd (version 0.9.6-4 from a a Debian
Lenny) to sync only TCP connections.
In the past few days I've read this tutorial:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
and after that I've one question:
Conntrackd is capable to sync also the UDP entries of the state machine?
If it is so: it is a good thing to configure conntrackd to sync also the
UDP entries in a clustered firewall?

Thank you in advance.

-- 
Michele Codutti
Centro Servizi Informatici e Telematici (CSIT)
Universita' degli Studi di Udine
via Delle Scienze, 208 - 33100 UDINE
tel +39 0432 558928
fax +39 0432 558911
e-mail: michele.codutti at uniud.it

