From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: [Unreassembled Packet (incorrect TCP checksum)]
Date: Wed, 23 Mar 2005 14:52:34 +0200
Message-ID: <1403218a050323045250d8bef3@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

I was running tethereal (CLI version of ethereal), and found several
packets like that

6846.050317 212.x.y.z -> 10.11.1.24   HTTP HTTP/1.1 200
OK[Unreassembled Packet (incorrect TCP checksum)]
6850.329578 212.x.y.z -> 10.11.1.29   HTTP HTTP/1.1 200
OK[Unreassembled Packet (incorrect TCP checksum)]
6850.331642 212.x.y.z -> 10.11.10.2   HTTP HTTP/1.1 200
OK[Unreassembled Packet (incorrect TCP checksum)]
6851.551598 212.x.y.z -> 10.11.1.24   HTTP HTTP/1.1 200
OK[Unreassembled Packet (incorrect TCP checksum)]


Who writes this { [Unreassembled Packet (incorrect TCP checksum)]  }  ???
Any meaning for that ??
Is it a faulty network card ??

Regards

-- 
Mohamed Eldesoky
www.eldesoky.net

