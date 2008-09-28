From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: forward/proxy/something one external IP to an other
Date: Sun, 28 Sep 2008 13:09:49 -0500
Message-ID: <48DFC86D.4020402@riverviewtech.net>
References: <CD6321314686A64C90A1F5870AAD3D5201566663@MAIL031.mail.lan> <48DD2D2C.8030202@riverviewtech.net> <48DD6F84.9070002@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DD6F84.9070002@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 9/26/2008 6:25 PM, Brian Austin - Standard Universal wrote:
> I think like this...
> 
> iptables -t nat    -A PREROUTING -d 192.168.19.253 -i eth19 -p tcp 
> --dport 993 -j DNAT --to-destination 192.168.41.5:993
> 
> iptables -t nat -A  POSTROUTING -d 192.168.41.5 -j MASQUERADE

Yep, that's the idea.

You may also need to allow for the forwarded traffic in your 
filter:FORWARD chain, depending on how secure you have it.



Grant. . . .
