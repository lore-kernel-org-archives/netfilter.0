From: Daniele Rossetti <roxydany22@gmail.com>
Subject: Replacing data in skbuff
Date: Fri, 5 Aug 2011 01:15:54 +0200
Message-ID: <17ECC3DD-F510-4EB6-A812-A499CBE60C62@me.com>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:content-type:content-transfer-encoding:subject:date:message-id
         :to:mime-version:x-mailer;
        bh=UAO/swNf1RNVc7byu9WXQAd7mN4F1xxkjaodN9dFnB0=;
        b=ebvqagu9kdO2QeqxuhDa0Hi2WqefHCJiiOCdzAA6ek4CPR4sHoXStnBobNvV2oUqkD
         0XOxaMYyh1cb8cVDhe2wcxPtdZA5+b5Yi+9Al52jK0BdGKgs7ua9Fh5xn5ks8RgY7gwd
         EkE3PBbkTEkIbQZB2AXeqnM8smyI4cjOXzv0k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello People,
I'm trying to write a target for netfilter which replace packet payload, but I'm having some troubles, cause I don't really know what is the best way to do it.
I tried this way: 

/* payload points to the old payload in skb */
memcpy(payload,newpayload,newpayload_size*sizeof(char));
skb->len = skb->len-payload_size+newpayload_size;
/*new checksum and ip total length*/
(skbuff is big enough to contain the new payload)

and this way, using some skbuff api:

/*Get ip+tcp/udp header*/
int header_len = payload - (char *) skb->data;
char *header = kmalloc(sizeof(char)*header_len,GFP_KERNEL);
memcpy(header,skb->data,header_len);
/*Remove all data from skb */
skb_pull(skb,skb->len);
/*Reserve new data space*/
skb_put(skb,newpayload_size+header_len);
/*Copy old header and new payload*/
memcpy(skb->data,header,header_len);
memcpy(skb->data+header_len,newpayload,newpayload_size);

Both seems to work somehow (most of the time) but system takes a while to handle the packet and looking in kernel log there is this message more than once: BUG: schedule while atomic

any idea?!