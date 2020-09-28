From: Devin Bayer <dev@doubly.so>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 18:26:04 +0200
Message-ID: <e144da82-726e-21fb-fcad-7181a19b0bb7@doubly.so>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
 <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
 <20200928123213.GF20886@dimstar.local.net>
 <dc380b6d-4085-13c7-9687-405825585823@doubly.so>
 <20200928160809.GB2605@salvia>
 <dcece986-3760-ddab-a726-213ac103e4d8@doubly.so>
 <20200928162122.GA3287@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1601310367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DTnIU8+Z6LXnD7narjkMYZ0NmPLar6fe5OxKTsPz/sU=;
        b=nFOSgqIAA3gM7oXKRdJOgyo9+ofHGvKv49cNx93afOA8b/iXjxS9r7YuDWdtf+95LIb5rZ
        ydfZqjacTIisXZChilDs3a6Y5OBsn9v0WjXT98K+RAJPheDsFBEu1EhNRjfUAIhAcQslbS
        SEV38SLH5O5ovYXMPI0s1791xh+SMEMyhZ+HxnlWqER93KLobJxMAzvYiT7f2cQrIAsuuz
        B7VNCGWyR7wHlSmFIaXm3/qMT5QWLrRnivJSW4rvgyTfM5qjXFJYhMwMrUv537tu9f8wOo
        uKsU3WqWoYpkTAM4huXL+9AHO/AFiEF7DlOcZto/dTZTXM+qMee7gCERvZDZBQ==
In-Reply-To: <20200928162122.GA3287@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: duncan_roe@optusnet.com.au, "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org



On 28/09/2020 18.21, Pablo Neira Ayuso wrote:

 > On Mon, Sep 28, 2020 at 06:12:21PM +0200, Devin Bayer wrote:

 >>

 >> How do I get the behavior like in the wiki, which uses maps?

 >

 > What example are you referring to?


https://wiki.nftables.org/wiki-nftables/index.php/Meters



% nft list map my_filter_table my_ssh_meter

table ip my_filter_table {

	map my_ssh_meter {

		type ipv4_addr . inet_service

                 size 65535

		flags dynamic,timeout

		elements = { 64.62.190.36 . 55000 expires 38s : counter packets 2 
bytes 220, 83.98.201.47 . 35460 expires 39s : counter packets 10 bytes 
5988, 172.217.7.142 . 43254 expires 46s : counter packets 1 bytes 98}

	}

}



