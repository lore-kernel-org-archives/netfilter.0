From: John <futurasci@gmail.com>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 15:56:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ef83df6b04071806565f854eb6@mail.gmail.com>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181146.30331.Antony@Soft-Solutions.co.uk> <ef83df6b0407180428f43532d@mail.gmail.com> <200407181313.47640.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407181313.47640.Antony@Soft-Solutions.co.uk>
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

> Tcpdump is a good packet sniffer but it does not show the data in a
> user-friendly format.

ok I've made another tcpdump for ethereal and it's ok;

I've checked and I get a lot of this scheme :

No.     Time        Source                Destination           Protocol Info
     10 0.004569    24.33.232.227         mydomain         TCP     
1488 > http [SYN] Seq=0 Ack=0 Win=64240 Len=0 MSS=1460
     11 0.004626    mydomain         24.33.232.227         TCP     
http > 1488 [SYN, ACK] Seq=0 Ack=1 Win=5840 Len=0 MSS=1460
    255 0.162181    24.33.232.227         mydomain         TCP     
1488 > http [ACK] Seq=1 Ack=1 Win=64240 Len=0
    258 0.165191    24.33.232.227         mydomain         TCP     
1488 > http [FIN, ACK] Seq=1 Ack=1 Win=64240 Len=0
    259 0.165313    mydomain         24.33.232.227         TCP     
http > 1488 [FIN, ACK] Seq=1 Ack=2 Win=5840 Len=0
    385 0.311935    24.33.232.227         mydomain         TCP     
1488 > http [ACK] Seq=2 Ack=2 Win=64240 Len=0

(this is the whole tcp stream)

for others I get the complete http exchange : get ...

is it normal ?

Ethereal is brand new for me so if you have some good tips to help me
find some interesting information ... thanks a lot

John

