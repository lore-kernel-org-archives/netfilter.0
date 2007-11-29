From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: Blocking web-based proxy traffic
Date: Thu, 29 Nov 2007 11:55:48 +0100
Message-ID: <m3bq9d722z.fsf@ursa.amorsen.dk>
References: <C3731AB4.2210%jlay@slave-tothe-box.net> <474DD11A.4020209@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

>>>>> "GT" == Grant Taylor <gtaylor@riverviewtech.net> writes:

GT> The preferred option would be to DNAT (redirect) the traffic to a
GT> mini web server that will serve up a generic web page indicating
GT> that the access has been blocked.

The GET request only gets transmitted once the three-way TCP handshake
is done. By then it's way too late to DNAT anything -- the mini web
server wouldn't get a SYN, so it would throw away the packet.


/Benny


