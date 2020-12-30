From: Brian Pond <brian@datahenge.com>
Subject: Correction to nftables wiki
Date: Wed, 30 Dec 2020 11:17:25 -0800
Message-ID: <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>
References: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>
Reply-To: brian@datahenge.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-h/+WlasQSmZIZFRSyKGe"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-h/+WlasQSmZIZFRSyKGe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Dear Netfilter Team,

I would like to propose a correction to the following Wiki page.
https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority

After the code block, the following sentence reads:

"If priority of the 'input chain' above would be changed to -1, all
packets would be dropped. "

This sentence is incorrect.  All packets will be dropped, regardless of
the priority.  Because within the same hook, a "drop" action always
takes precedence over "accept".  Even if the "drop" is in a chain with
a later priority.

* I have attached an example illustrating this.  If you load this
ruleset with nft, browsing the web is impossible.  Regardless of
whatever priority value you choose.
* I have previously submitted a bug report about this behavior.  I
don't believe Netfilter was intended to work this way.

Either way, I feel the wiki should be updated for accuracy.  That way
readers understand how Netfilter is currently working, with regard to
drop and priority.

Please let me know if you have any questions.  I would be happy to
discuss further, meet online, etc.

Brian Pond


-- 
Brian Pond
Datahenge LLC
Business Software Consultant
Web: www.datahenge.com
Email: brian@datahenge.com
Tel: 509-808-3255


--=-h/+WlasQSmZIZFRSyKGe
Content-Disposition: attachment; filename="nftables_example.conf"
Content-Type: text/plain; name="nftables_example.conf"; charset="UTF-8"
Content-Transfer-Encoding: base64

IyEvdXNyL3NiaW4vbmZ0IC1mCgpmbHVzaCBydWxlc2V0Cgp0YWJsZSBpbmV0IGZpbHRlciB7CiAg
ICBjaGFpbiBpbnB1dCB7CiAgICAgICAgdHlwZSBmaWx0ZXIgaG9vayBpbnB1dCBwcmlvcml0eSAw
OyBwb2xpY3kgYWNjZXB0OwogICAgfQoKICAgIGNoYWluIHNzaCB7CiAgICAgICAgdHlwZSBmaWx0
ZXIgaG9vayBvdXRwdXQgcHJpb3JpdHkgMDsgcG9saWN5IGFjY2VwdDsKICAgICAgICB0Y3AgZHBv
cnQgODAgYWNjZXB0OwogICAgICAgIHRjcCBkcG9ydCA0NDMgYWNjZXB0OwogICAgfQoKICAgIGNo
YWluIG91dHB1dCB7CiAgICAgICAgdHlwZSBmaWx0ZXIgaG9vayBvdXRwdXQgcHJpb3JpdHkgMTU7
IHBvbGljeSBkcm9wOwogICAgICAgICMgUHJpb3JpdHkgZG9lcyBub3QgbWF0dGVyOyBvdXRib3Vu
ZCBwYWNrZXRzIHdpbGwgKmFsd2F5cyogYmUgZHJvcHBlZC4KICAgICAgICAjIERyb3AgaXMgYWN0
aW5nIGxpa2UgYSBnbG9iYWwsIHRlcm1pbmF0aW5nIGFjdGlvbiBhY3Jvc3MgdGhlIGVudGlyZSBo
b29rLgogICAgfQp9Cgo=


--=-h/+WlasQSmZIZFRSyKGe--

