From: Andre Correa <andre.correa@pobox.com>
Subject: DAT - dynamic address translation
Date: Mon, 2 Jun 2003 16:40:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <15818692816.20030602164031@pobox.com>
Reply-To: Andre Docena Correa <andre.docena@pobox.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi Netfilter list, I would like to know if anyway here have experience
trying  to  make  a  box act as a DAT system. DAT means that a box can
SNAT  any  IP  address  behind it. This is usefull on systems that sits
in front of a  network  that  may  have  clients using any static IP
address and its traffic should be NATed...

Ex: the linux box have an internal IP: 192.168.0.1/255.255.255.0 and a
client behind it have a 200.200.200.200/255.255.255.0 IP that should
be NATed to access the Internet...

Does anyway have tried this before? Is it possible under Linux?

Any information will be appreciated.

tks in advance...

Andre Correa
andre.correa@pobox.com


