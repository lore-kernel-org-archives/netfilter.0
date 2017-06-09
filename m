From: James <vger_tracker@trackivity.com>
Subject: nfqueue -> Net::Frame::Layer::ETH? (Perl)
Date: Fri, 9 Jun 2017 11:18:08 -0400
Message-ID: <8e283c34-9988-5cea-76a6-92bd16dbc044@trackivity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Short spew:

How does one take a netfilter-queued-to-userspace packet and turn it
into a Perl "Net::Frame::Layer::ETH" object?

No matter how I try to call "new(raw => $something)" it seems to ignore
the "raw" attribute and create a default-value'd object.

Yes, this is very much more of a Perl question than anything else but
since it's coming from netfilter (using nftables) I thought I would ask
here first.

Answers such as "go read such-and-such document/web page" are
quite welcome.

#-------------------

Long spew:

#---------

I did indeed manage to get all of this working with Perl "NetPacket::IP"
objects, but apparently that does IPv4 only and not IPv6.

What *does* work:

1) nftables "ct state { new } udp dport { domain } queue num 53 bypass",
2) Perl nfqueue-bindings (https://github.com/chifflier/nfqueue-bindings,
    "libnfqueue-perl" package on Ubuntu),
3) Perl NetPacket::IP (https://metacpan.org/pod/NetPacket::IP,
    "libnetpacket-perl" package on Ubuntu), and
4) Perl Net::DNS::Packet (https://metacpan.org/pod/Net::DNS::Packet,
    "libnet-dns-perl" package on Ubuntu)

together allow me to inspect DNS packets (UDP, so far) and issue
NF_ACCEPT or NF_DROP verdicts as I wish (so I can drop requests for
recursion, or not for my domains, and so forth).

And I can even add the (IPv4) source IPs as elements to an nftables
IP address set, complete with timeouts.

So far, so good.  In fact more like "totally awesome".  It eliminates
a lot of crap coming at me.

Except that "NetPacket::IP" appears to handle IPv4 packets only,
not IPv6.

If someone tells me that "NetPacket::IP" does indeed do IPv6 and points
me at the detail that I'm missing then that would be great.

#---------

So I have tried flipping over to "Net::Frame" in the hopes that it can
both tell me if it's an IPv4 or IPv6 packet and then let me work my way
up from there.

What *doesn't* work (following is one of four attempts... scroll down
this email for all four together):

  $layer = Net::Frame::Layer::ETH->new(raw => $payload);

  ... that just seems to cheerfully ignore the "raw" attribute and
produce a default-valued result as described by the documentation.

Code appended below produces following result... what am I doing wrong
such that "new" does not see the data that I'm trying to give it?

#---------

Got a layer:
ETH: dst:ff:ff:ff:ff:ff:ff  src:00:00:00:00:00:00  type:0x0800
Got a layer:
ETH: dst:ff:ff:ff:ff:ff:ff  src:00:00:00:00:00:00  type:0x0800
Got a layer:
ETH: dst:ff:ff:ff:ff:ff:ff  src:00:00:00:00:00:00  type:0x0800
Got a layer:
ETH: dst:ff:ff:ff:ff:ff:ff  src:00:00:00:00:00:00  type:0x0800

#---------

#!/usr/bin/perl -w

use strict;
use nfqueue;
use Socket qw(AF_INET AF_INET6);
use Net::Frame::Layer::ETH;

my $q;

sub cleanup() {
  $q->unbind(AF_INET);
  $q->close();
}

sub cb() {
  my $payload;
  my $data;
  my $layer;

  ($payload) = @_;
  if ($payload) {
   $data = $payload->get_data();
   $layer = Net::Frame::Layer::ETH->new(raw => $payload);
   if ($layer) {
    print("Got a layer:\n");
    print($layer->print,"\n");
   };
   $layer = Net::Frame::Layer::ETH->new(raw => $data);
   if ($layer) {
    print("Got a layer:\n");
    print($layer->print,"\n");
   };
   $layer = Net::Frame::Layer::ETH->new(raw => \$payload);
   if ($layer) {
    print("Got a layer:\n");
    print($layer->print,"\n");
   };
   $layer = Net::Frame::Layer::ETH->new(raw => \$data);
   if ($layer) {
    print("Got a layer:\n");
    print($layer->print,"\n");
   };
   print "---\n";
   $payload->set_verdict($nfqueue::NF_ACCEPT);
  }
}

$q = new nfqueue::queue();

$SIG{INT} = "cleanup";

$q->set_callback(\&cb);
$q->fast_open(53, AF_INET);
$q->set_queue_maxlen(5000);
$q->try_run();

#---------

-- 

  - James
