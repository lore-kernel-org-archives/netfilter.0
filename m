From: Simon <greminn@gmail.com>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Thu, 13 Nov 2008 14:30:25 +1300
Message-ID: <5bdb1aa70811121730q2e408493p2cb4e86c6e12303b@mail.gmail.com>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>
	 <49149060.70100@riverviewtech.net>
	 <5bdb1aa70811091514t506c9f7dib2d40ac26bba02b0@mail.gmail.com>
	 <49178DAF.5090105@riverviewtech.net>
	 <5bdb1aa70811091906v5b5f0caco6bac4de9cea23cc5@mail.gmail.com>
	 <4917BAE7.5080207@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=A5SsjBmk6RfgT8nmGJLAH++v/6lOz3QGwnvya7lJHxQ=;
        b=iIOf++DhMHVK9P91KqnaoCsPzEiVeTkavdcHg84XLHZcV9fENOENZqJMI6mk7SM5QS
         vohfMct5W7Z94v+sCBXCb3LZEjLc2P799YcH3bckN58XnNcVmtXl2CTkdn1wiHYtHHhP
         Ktu9Bky8mEIaYusny77xxBHJhWVA1UJRpAmdo=
In-Reply-To: <4917BAE7.5080207@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Mon, Nov 10, 2008 at 5:39 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:

> For the record and those who might be searching the archives in the future,
> will you please do a quick overview of what you did to make this work?
>  Thanks.

Sure! Changed from IPCOP to Endian firewall and enabled the SNAT
function on the port forward rule :)
