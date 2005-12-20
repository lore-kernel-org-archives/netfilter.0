From: Thanos Panousis <pthanos@gmail.com>
Subject: Re: perl-ipqueue: re-inserting a packet?
Date: Tue, 20 Dec 2005 16:14:52 +0100
Message-ID: <4dcb3660512200714m2632b83ds990fa91e6410c31c@mail.gmail.com>
References: <4dcb3660512200154w7b2d3a18yfd18096af605952c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4dcb3660512200154w7b2d3a18yfd18096af605952c@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I am getting the feeling that the problem of encoding bad-checksummed
IP packets lies in the NetPacket::IP lib. I found some people claiming
that there is a bug in its IP checksum
calculation.....(http://larseggert.de/older-software.html in the
bottom).

Could somebody verify that NetPacket::IP indeed encodes good packets
or not? I encode packets exactly as seen in example code, but packets
are reported to have a BAD IP checksum by ethereal. The TCP checksum
is ok..

Thanks, really looking forward to a reply on this.

On 12/20/05, Thanos Panousis <pthanos@gmail.com> wrote:
> Hello to everyone,
>
> I am using -j QUEUE to handle some packets myself and then send them
> on their way. I am using the perl library IPTables::IPv4::IPQueue in
> order to hook myself in the queue and of course NetPacket::* to play
> around with the packets.
>
> The following code, can successfully do stuff conserning the packets
> it receives, BUT when I try just to decode a packet all the way to
> TCP, and then (without changing anything) try to re-encode in order to
> send back to netfilter, ethereal reports that my packets have a wrong
> checksum.....
>
> <code>
> my $queue =3D new IPTables::IPv4::IPQueue(copy_mode =3D> IPQ_COPY_PACKET,
>                                                 copy_range =3D> 2048)
>         or die IPTables::IPv4::IPQueue->errstr;
>
> while(1){
> my $msg =3D $queue->get_message(TIMEOUT);
> if (!defined $msg) {
>         next if IPTables::IPv4::IPQueue->errstr eq 'Timeout';
>         die IPTables::IPv4::IPQueue->errstr;
> }
>
> my my $ip_obj =3D NetPacket::IP->decode($msg->payload());
> my $tcp_obj =3D NetPacket::TCP->decode($ip_obj->{data});
> #Attempt to reencode
> $ip_obj->{data} =3D $tcp_obj->encode($ip_obj);    #re-encode the tcp pack=
et
> and store inside the IP object
> my $ip_packet =3D $ip_obj->encode;        #re-encode the resulting IP
> packet(checksums hopefully recalculated)
> my $size;
> {
>         use bytes;
>         $size =3D length $ip_packet;
> }
> #try and flush the IP packet down the queue again, the error is probably =
here...
> $queue->set_verdict($msg->packet_id, NF_ACCEPT, $size,
> $ip_packet);#just set the NF_ACCEPT verdict and let the packet go
> }
> </code>
>
> I have not been able to find an example of some code that tries to
> alter packets. The exampes that come with perl-ipq are only for
> passing the packets back to netfilter. What is the "buf" that one is
> suppossed to put in set_verdict? Is it a NetPacket::IP->encode() ed
> packet? Or something different?
>

