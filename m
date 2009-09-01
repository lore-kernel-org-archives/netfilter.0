From: Patrick McHardy <kaber@trash.net>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension,
 consider recompiling your kernel or insmod the extension.
Date: Tue, 01 Sep 2009 15:21:41 +0200
Message-ID: <4A9D1FE5.70300@trash.net>
References: <4A9C2F4C.9050405@branndal.se> <200908311534.19700.rob0@gmx.co.uk> <4A9CD19C.6040107@branndal.se> <4A9D08FF.7070705@trash.net> <4A9D10DF.1050307@branndal.se> <4A9D151D.30808@trash.net> <4A9D1F98.7030100@branndal.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9D1F98.7030100@branndal.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Berg <thomas.berg@branndal.se>
Cc: /dev/rob0 <rob0@gmx.co.uk>, netfilter@vger.kernel.org

Thomas Berg wrote:
> Do you think this patch will be inckluden in debian unstble release soon
> or do I have to complie a new kernel to get it working?

It will be sent to the -stable kernel once it has hit upstream, when the
next merge window opens. So its probably going to be something like 2-3
weeks. Not sure how long it then takes for Debian to pick it up.
