From: Frank Ramirez <coquinino@gmail.com>
Subject: skb_copy_expand with a single pointer
Date: Mon, 10 Nov 2008 22:49:04 -0500
Message-ID: <7050DCE5-7BA8-4A32-8099-CAF17B1D7558@gmail.com>
Mime-Version: 1.0 (Apple Message framework v926)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :content-type:content-transfer-encoding:mime-version:subject:date
         :x-mailer;
        bh=PK2y2TdaDTMDSkPhk494+N4aFEarrmGbukkaqCRLyZc=;
        b=LP8LsSykg/rCHoiXQ/CceHLRwt1mLRfbDM7phn1Nlr4f84ayODIrE3Wuh+NYE/1imL
         g24jxMaI6kUK9bbz3LqPaeMpNg75POrHNtHlQ1QfKMEGfNPsALyLJO/J9HDNH1xPvZD2
         KoF6qoZie+MyTlwN2AhCDLu/hKRTeaYfQ+sTM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hello,

My teammate and I are working on a master's project involving  
netfilter.  Using Ubuntu 7.10 (kernel 2.6.22) we were able to  
successfully take a packet and perform a skb_copy_expand in order to  
enlarge its size and send it out with additional information.  This  
was when netfilter still used double pointers passed into its hook  
functions.  Simplified code is shown below:

sb = *skb;

if(skb_tailroom(sb) < our_length){
	new = skb_copy_expand(sb, skb_headroom(sb), skb_tailroom(sb) 
+our_length, GFP_ATOMIC)
	if(sb->sk)
		skb_set_owner_w(new, sb->sk);
	if(new)
	{
		*skb = new;
		sb = *skb;
	}
	else
	{
		printk(KERN_INFO "FAIL\n");
	}
}

Now we are trying to port the code to Ubuntu 8.04 (kernel 2.6.24) but  
netfilter has now moved to using only single pointers passed into its  
hook functions.  We tried the following code, but it doesn't work:

sb = skb;

if(skb_tailroom(sb) < our_length){
	new = skb_copy_expand(sb, skb_headroom(sb), skb_tailroom(sb) 
+our_length, GFP_ATOMIC)
	if(sb->sk)
		skb_set_owner_w(new, sb->sk);
	if(new)
	{
		skb = new;
		sb = skb;
	}
	else
	{
		printk(KERN_INFO "FAIL\n");
	}
}


Can anyone shed any light on how to make this work for the updated  
kernel?

Thanks,

-Frank
