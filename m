From: Oumer Teyeb <oumer@kom.auc.dk>
Subject: Re: about ipq_set_verdict()
Date: Tue, 20 Apr 2004 16:44:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40853764.2090504@kom.auc.dk>
References: <036e01c4227f$1611e900$68892090@grouse>
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

In the man pages it says that if you get a negative value then it is a
failure , otherwise it is a sucess.

The reason that you may get the packets dropped may be because you
modified them in such a way that they are not valid anymore (you change
thing to an invalid ip address or something like that)

On how to get the packet info

Once you get the packet = ipq_get_packet(buffer)

you can access the packet data (including header and payload) from
memory location packet +1,

for example

you can use something like

usigned char *packet_all = (unsigned char *) (packet+1);

then for example to access the ip_header length, which is located from
bits 4-7 in the ip header you can use something like

ip_header_len = (*packet_all & 0xF) * 4; // the 4 is since the header
length is specified as a multiple of 32bits,ie 4 bytes

or you can get the total length, which is the third and fourth bytes of
the header as

total_len = htons(*(unsigned short *) (packet_all + 2)))

and so on,

and based on the value of this ip header length and the data offset in
the tcp header,


(to find the data offset in the tcp header you can use something like

tcp_header_len = ((*(packet_all + ip_header_len + 12 ) & 0xF0) >> 4 )*
4; // the 12 is because we have 2 bytes for source port + 2 bytes for
destination port, 4 bytes for sequence number and 4 bytes for ack number
in the tcp header before we reach the data offset


so the data payload is from unsinged char *start = (packet_all +
ip_header_len+ tcp_header_len) till unsinged char *end = start + total_len


and I think you can just set the values of the packet, whether header or
payload, once you got a pointer to it






Jee J.Z. wrote:

>Hi all,
>
>I am using the libipq library to do userspace programming on netfilter. I am
>having some problems understanding the return values of the function
>ipq_set_verdict():
>
>When I set verdict (either NF_ACCEPT or NF_DROP) without modifying the
>packet, the return value of ipq_set_verdict is 28 and everything works well;
>however, when I set verdict trying to modify the packet, ipq_set_verdict
>returns 88, and the packet seems always to be dropped even when I set
>NF_ACCEPT.
>
>Does anybody know what these return values mean? Moreover, could anybody
>tell me how I can successfully modify a packet using libipq? Thank you very
>much in advance!!
>
>Regards,
>Jee
>
>
>



