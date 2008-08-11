From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Target IP monitoring...
Date: Mon, 11 Aug 2008 15:03:40 -0500
Message-ID: <48A09B1C.9000104@riverviewtech.net>
References: <48A08A37.3050104@riverviewtech.net> <alpine.LNX.1.10.0808111554010.26664@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808111554010.26664@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/11/08 14:55, Jan Engelhardt wrote:
> Eww no, don't do that. Though Netfilter is written like that, there 
> is no hard guarantee that only first packets are seen. (Like, we 
> forget to take our medication and all packets go through the 
> then-semi-stateless nat table ;-) Better use -m conntrack --ctstate 
> NEW -j ULOG.

*nod*

So technically it /would/ work, but it would also be bad form to do it 
that way.



Grant. . . .
