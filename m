From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking web-based proxy traffic
Date: Thu, 29 Nov 2007 13:21:49 -0600
Message-ID: <474F114D.6040807@riverviewtech.net>
References: <C3731AB4.2210%jlay@slave-tothe-box.net> <474DD11A.4020209@riverviewtech.net> <m3bq9d722z.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m3bq9d722z.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/29/07 04:55, Benny Amorsen wrote:
> The GET request only gets transmitted once the three-way TCP 
> handshake is done. By then it's way too late to DNAT anything -- the 
> mini web server wouldn't get a SYN, so it would throw away the 
> packet.

Very good point.  I did not think of that.

Would it be possible to possibly replace the returning traffic from a 
custom daemon that could essentially be a man in the middle.  In effect 
alter the returning stream back to the requesting client and close out 
the connection to the answering server?  A "Cut-In" if you will?  I 
would think that you could pass the traffic via a NetLink interface to a 
custom program that could do what is needed.

Is something like this possible or am I smoking too much again?



Grant. . . .
