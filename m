From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: Error when adding an entry to mangle/PREROUTING
Date: Mon, 9 Feb 2009 12:38:25 -0800
Message-ID: <49909453.18068e0a.3fb8.fffff08f@mx.google.com>
References: <gmq2gg$g63$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=3E4jFYefjjEPsVFK1bL9r63yz08G/8RHC/5UvQO9yp0=;
        b=oHfd0shJuZ28N252k2yuLx2dh4pLCj2ooKR8muKdVrddJ5RvP4HO8blw0eNRFGfZ6a
         VfJxj+BQ6ooaKPYi92xYCfrmUFgsZMcmXTHPiJik64AKXADwZK9Mk73AkJ23hsRURLdd
         ixsWaf+D0g2XUcpJVowralHxGHQ6aFUgE7ZF0=
In-Reply-To: <gmq2gg$g63$1@ger.gmane.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ralf' <rm@amitrader.com>, netfilter@vger.kernel.org

Quoting from man iptables: " This  target is only valid in the INPUT,
FORWARD and OUTPUT chains"

Since the validation is done by the kernel module, you don't see the error
message directly, but rather via syslog; e.g. in my case, in
/var/log/messages you see " kernel: ip_tables: REJECT target: only valid in
filter table, not mangle"

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Ralf
> Sent: Monday, February 09, 2009 12:08 PM
> To: netfilter@vger.kernel.org
> Subject: Error when adding an entry to mangle/PREROUTING
> 
> The following command brings an error ("iptables: Invalid argument"):
> 
>    $IPTABLES -t mangle -A PREROUTING -p tcp --dport 9999 -j REJECT
> 
> What's wrong here?
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

