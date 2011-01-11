From: Alessandro Vesely <vesely@tana.it>
Subject: Best way to kill a live TCP connection?
Date: Tue, 11 Jan 2011 13:35:30 +0100
Message-ID: <4D2C4E92.6040902@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1294749330; bh=VOtZ924CGhLvxMaFes3898SHZtLiz2YT5OsNeM/VHl4=;
	l=4682;
	h=Message-ID:Date:From:MIME-Version:To:Content-Transfer-Encoding;
	b=XXry2CfvagECgtX0P7OGgMtCm5K9goMz6ctAUcWm6gcmVMcYpSmXvos/uspMN3eib
	 ILCfSgvZeRgf1xlgRQphfAnn7DSfxwgFdN2vTy5RGfhvTuKt+GdDe/x7ErhMVi0T6H
	 MNmo1SZ45g9yUptVyaSXiZAmBDlIsWG2bqxTftUM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
this is clearly an overworked topic.  However, I haven't been able to
find definitive info about it.  Please help providing more insight.
In particular, if it is possible/convenient to design an RST injector
that uses libnetfilter_queue and how to attach it to iptables?  (I
would only send a RST to the local host/network.)

On iptables it is possible to say -j REJECT --reject-with tcp-reset.
From a netfilter, it is possible to mark packets whose connection has
to be forcibly closed, so that that REJECT target triggers for marked
packets.  However, this is overkill, as it implies filtering all
packets rather than just --syn.  In my case, I would kill the
connection right after detecting bad behavior, and at the same time
store the remote IP address in the database checked by a netfilter so
that further connection attempts will be dropped for a while.

Hm... but how to kill a live TCP connection?  I detect bad behavior
asynchronously (e.g. from log files) and thus would need a program or
function that kills any connection to the relevant IP address.  I've
found three different answers on google:


tcpkill
http://monkey.org/~dugsong/dsniff/
This takes a libpcap expression and generates raw TCP RST packets in
response to any matching packet.  The packet itself is not dropped,
but the connection is terminated.  The main loop is conceived like so:

	for (;;) {
		if ((pkt = (char *)pcap_next(pd, &pkthdr)) != NULL) {

	                // killer code is here
		}
	}

Part of the killer code looks like this:

	/*
	XXX - we ought to determine the rate of seqnum consumption and
	predict the correct seqnum to use, instead of brute force.
	*/
	for (i = 0; i < Opt_severity; i++) {
		ip->ip_id = libnet_get_prand(PRu16);
		seq = ack + (i * win);
		tcp->th_seq = htonl(seq);
		// ...
	}

Opt_severity is allowed values in [0, ..., 9] and by default is 3.


killcx
http://spamcleaner.net/en/misc/killcx.html
This is a parent/child Perl written procedure.  The parent sends a SYN

  # wait 0.5 second for our child to be ready :
  select( undef, undef, undef, 0.5 );
  print "[PARENT] sending spoofed SYN to [$local_ip:$local_port]".
     " with bogus SeqNum\n";

  # send spoofed SYN packet :
  my $packet = Net::RawIP->new({
      ip => {  frag_off => 0, tos => 0,
               saddr => $dest_ip, daddr => $local_ip
            },
      tcp =>{  dest => $local_port, source => $dest_port,
               seq => 10, syn => 1
            }
   });
   $packet->send;

The child sends a RST getting acknum from the packets it sniffs (using
Net::Pcap).  So one is left wondering whether sending that SYN packet
was necessary and reliable.  Apparently, without such kickoff packet
the program works only if some pristine packet happens to arrive on
the connection during the prescribed interval.

   # look for the magic acknum :
   if ( $tcp->{acknum} ) {
      print "[CHILD]  sending spoofed RST to [$local_ip:$local_port]".
         " with SeqNum [$tcp->{acknum}]\n";
      # we have it : spoof another packet (RST) with the correct seqnum
      # to close the connection :
      my $packet = Net::RawIP->new( {
         ip => {  frag_off => 0, tos => 0,
                  saddr => $dest_ip, daddr => $local_ip
               },
         tcp =>{  dest => $local_port, source => $dest_port,
                  seq => $tcp->{acknum}, rst => 1
               }
      } );
      $packet->send;

(For ESTABLISHED connections, a RST to the remote host is also sent.)


cutter
http://www.lowth.com/cutter/
This describes how to set up iptables rules, and suggests to inject a
forged packet, similar to killcx above, but without sniffing
packets.  Cutter uses FIN rather than SYN for the kickoff packet, and
describes its purpose like so:

  [I]f the firewall sends a packet that is "correct" in all respects
  except for the sequence number, then the host very helpfully tells
  us what should have been used.

Is that (still) true?

The site presents a self-contained, single-source, C program to
implement that technique.  The source is quite dated (April 2005) and
may need some adjustment, but even then did not work for me (either
my kernel or my firewall manage not to "helpfully tell" that number.)


For completeness, let me also mention a couple of related articles:

Programming with Libpcap
http://www.programming-pcap.aldabaknocking.com/

Detecting Forged TCP Reset Packets
http://www.isoc.org/isoc/conferences/ndss/09/pdf/08.pdf
(This mentions more RST injectors, snort and bro, and discusses
various details of injected RST packets.)
