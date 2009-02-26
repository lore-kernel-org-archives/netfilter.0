From: Michele Codutti <michele.codutti@uniud.it>
Subject: nf_ct_tcp_be_liberal and a clustered bridge.
Date: Thu, 26 Feb 2009 11:55:40 +0100
Message-ID: <1235645740.4142.50.camel@menhir.cc.uniud.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I'm working on a cluster of two bridge firewalls.
In many documents that talks about redundant firewalls (that you can
find googling around) you read that it is necessary to enable the option
nf_ct_tcp_be_liberal in the netfilter module to allow a better handling
of the connections takeover between the two nodes of the cluster.
Sure this statement is true for firewall with routing functions but is
also true for firewall with totally transparent bridges (without an IP)?

Thank you in advance.
 
-- 
Michele Codutti
Centro Servizi Informatici e Telematici (CSIT)
Universita' degli Studi di Udine
via Delle Scienze, 208 - 33100 UDINE
tel +39 0432 558928
fax +39 0432 558911
e-mail: michele.codutti at uniud.it

