From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Re: Packet Inspecting Filter with IPTables
Date: Thu, 26 Aug 2004 07:11:48 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <005101c48b5d$7b612540$0200a8c0@floydian>
References: <200408260450.i7Q4ooX5078698@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Andrew <corporate@superonline.com>, netfilter@lists.netfilter.org

Hi Jeremy,
You can either use Snort or there is a patch available to do layer7 =
filtering. The link is
http://l7-filter.sourceforge.net/

After patching your kernel & iptables you will be able to create your =
own script to catch the packets and take action on them. It is a very =
good tool. I have been using this a lot to track p2p traffic, messenger =
traffic that disguise themselves and run on port 80.

I hope this helps.
Good luck,
Deepak
  ----- Original Message -----=20
  From: Jeremy Andrew=20
  To: netfilter@lists.netfilter.org=20
  Sent: Thursday, August 26, 2004 1:50 AM
  Subject: Packet Inspecting Filter with IPTables=20


  I wish to implement a feature on a linux box which I explained with =
detail
  in the following text;

  I have read about many different articles on how to take actions based =
on
  the contains of a packet. I think netfilter/iptables has support of =
what I
  wish to deploy on a Linux machine (kernel 2.4.20) acting as a gateway
  network node. I have not found enough information about the exact =
steps to
  be taken in order to;

  - Inspect each and every incoming packet for a specific port (ftp as =
an
  example), and then if the data packet contains a specific set of bits =
(ascii
  characters "GLOB" e.g), take actions based on a predefined rule (send =
a
  message to syslog) and then "drop" this packet.

  Should I install a newer version than I currently have (iptables  =
v1.2.6a)
  or does this version contain the feature I require? Indeed, I do not =
wish to
  make an upgrade to iptables since this is a "production" environment, =
but I
  can add another box only for this purpose, so even alpha / beta =
versions are
  accepted.=20

  I would be glad if I see exact steps to take since I really do not =
have much
  time to make a research on the matter right away.=20

  Regards...
  =20





