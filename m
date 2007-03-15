From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: bytes count question
Date: Thu, 15 Mar 2007 18:00:27 +0100
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49CBF@knowledge.wizdom.nu>
References: <45F95EA9.3030201@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F95EA9.3030201@unipex.it>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>, netfilter@lists.netfilter.org

Yes, only the first packet of a connection is counted. You should use a
traffic analyzer for what you want to do.

-Sietse



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Michele
Petrazzo - Unipex srl
Sent: Thursday, March 15, 2007 15:57
To: netfilter@lists.netfilter.org
Subject: bytes count question

Hi list,
I'm making some test for see "how many traffic" create an IP, so, into
the gateway, I create a chain, add a rule so all the traffic go through
it, and here accept all the traffic.
After, from that IP, I download a file that has 1 MB and I control with
a "iptables -nxvL my_chain" what number are on the "bytes" columns, but
with a big surprise, I see 60000.
What're this number?

I thought to find something like 1048000 (or similar)!

I'm missing something?

Thanks,
Michele


