From: Justin Kay <jkay@nwrecc.org>
Subject: DNAT
Date: Thu, 12 Dec 2002 11:00:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11FE00AA8C43D311ABE3000629B0CB481398F3@DBSISERVER>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

When using a linux box to DNAT to some other boxes in a private address
space, do you need to alias all of the public ip addresses that you will be
doing DNAT for on the linux box?

internet--->208.224.51.10 (LINUX PUB IP FAKE) Linux/DNAT---> 10.10.20.15
other box
	    208.224.51.11 (alias used for other box)  IS THIS NEEDED in
order for it to work?	


Justin

