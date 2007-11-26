From: Peter Warasin <peter@endian.com>
Subject: CONNMARK udp comprehension question
Date: Mon, 26 Nov 2007 21:28:21 +0100
Message-ID: <474B2C65.1060706@endian.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000001020006020808090306"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------000001020006020808090306
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi List

Have a question in order to understand if i am tilting at windmills or
if there's an issue with my setup.

Here a short description of my scenario to help me to explain myself:

I have a box with multiple uplinks running openvpn in udp mode. One of
the uplinks has the default gateway (no multipath route). Now, whenever
i connect to an uplink which actually hasn't the default gateway,
packets go in through that device and exit through another (due to the
default gateway), which will break the udp-"connection".

Now, the question:
I mark all connections entering a specific uplink with a number using
CONNMARK, in order to be able to distinguish them and make them leave
the correct interface using fwmark based ip rules.

Shouldn't now the CONNMARK target, mark the connection in such a manner
that the udp packets coming in have the same mark as the udp packets
going out whenever they belong to the same "connection"?
Or is this just not possible due to the connection-less nature of udp?

Same setup works for me with tcp and it also works with udp when the
connections going through the box (FORWARD).

Kernel is RH'L5.1's kernel-2.6.18-53 with all relevant options enabled
and iptables 1.3.8.

Any help would be greatly appreciated!

peter

-- 
:: e n d i a n
:: open source - open minds

:: peter warasin
:: http://www.endian.com   :: peter@endian.com

--------------000001020006020808090306
Content-Type: text/x-vcard; charset=utf-8;
 name="peter.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="peter.vcf"

begin:vcard
fn:Peter Warasin
n:;Peter Warasin
org:Endian GmbH/Srl
adr:;;Pillhof 47;Frangart/Frangarto;BZ;I-39010;Italien/Italia
email;internet:peter@endian.com
tel;work:+39 0471 631763
tel;fax:+39 0471 631764
x-mozilla-html:FALSE
url:http://www.endian.com
version:2.1
end:vcard


--------------000001020006020808090306--
