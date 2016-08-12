From: "Mohamed Elsied Hammad" <mohamed@elsied.net>
Subject: H.225.0 NAT packet mangling module?
Date: Fri, 12 Aug 2016 18:32:36 +0300
Message-ID: <009101d1f4ae$c3940680$4abc1380$@elsied.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Everyone,

I'm scratching my head a bit on this one.

I have a video endpoint behind a NAT box that is able to initiate calls with
no issues, however it is unable to receive calls from external sources. The
call seems to initially connect then just fails.

I ran a tcpdump on my NATing box (Ubuntu 16.04, 4.4.0-34-generic) and made a
call from an external source to my unit. I observed the following:

1.	Standard incoming TCP SYN, SYN/ACK, ACK packets on port 1720 between
my video endpoint and the external video endpoint..
2.	"H.225.0 CS: setup" packet from the external endpoint to my
endpoint.
3.	"H.225.0 CS: alerting" packet from my endpoint to the external
endpoint.
4.	"H.225.0 CS: connect" packet from my endpoint to the external
endpoint. - Here is where I think the problem is. When I inspected the H.323
message body in this packet I found that my unit is passing its internal IP
(192.168.1.100) as the "h245 ip address", which is expected since it is not
aware of the NAT. I need a way to mangle this packet on my NAT box before
sending it out. I need to replace the endpoint's internal IP with the NAT
box's public IP address in the "h245 ip address" field. The NAT box should
then continue to handle forwarding of packets to/from the endpoint as it is
currently doing.

I did some searching on this list and elsewhere and found a couple of
references to modules that are supposed to help with scenarios like this
(nf_nat_sip , nf_conntrack_sip , nf_conntrack_h323 and h323_conntrack_nat).
I'm a bit confused about which module I should be using and whether I should
load it with certain options. Also how should my iptables rules be updated
after loading the required module(s)? Am I even going down the right path
here?

Thanks,
Mo

