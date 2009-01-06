From: =?ISO-8859-13?Q?Art=FBras_=D0lajus?= <x11@arturaz.net>
Subject: Re: Mystics of packet forwarding
Date: Wed, 07 Jan 2009 00:52:15 +0200
Message-ID: <4963E09F.4020608@arturaz.net>
References: <4963B3EB.6090806@arturaz.net> <a43edf1b0901061254t1e3a6fb1v3a4f75b870bae810@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a43edf1b0901061254t1e3a6fb1v3a4f75b870bae810@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Billy Crook <billycrook@gmail.com>
Cc: netfilter@vger.kernel.org

Another strange thing - sometimes it does work, sometimes it just hangs... I 
wonder - wtf...

gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
gw:/var/log/ulog# nc -v -v yui.yahooapis.com 80
DNS fwd/rev mismatch: geoycs-l.yahoo8.akadns.net != l1.ycs.vip.ch1.yahoo.com
geoycs-l.yahoo8.akadns.net [87.248.125.47] 80 (www) open
^C sent 0, rcvd 0
