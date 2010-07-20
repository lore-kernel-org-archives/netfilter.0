From: Padmalochan Moharana <padman.m@gmail.com>
Subject: Regarding write send a packet to network that received in 
	NF_IP_PRE_ROUTING
Date: Tue, 20 Jul 2010 16:19:06 +0530
Message-ID: <AANLkTilFBhfh-jBBaO4eJAzDw0gU_PhBEcEc1mdsUjjo@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=EcgCAfFop13zY4qQEhZO+/OuPM62NCrIIHnQDS9Ulpo=;
        b=ONSIL5Q2A8fIUw5rUaNJzVKI9k60kOaNLUspKqJFJEhVYnPhp19XYm/Xp/jS/SjxIc
         1VLajMY9GXfjwQTTFTUBhMnTTpu4iyHEpIbohTJSir+DziAuyKBl2VtjowyDe9QmI0E5
         dt2Oka9a3e8vIzLk+2us/qJ+Y9uhx/7JkRXVA=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

i am facing problem during sending a packet that received in
NF_IP_PRE_ROUTNG hook to network again  .
After receive a packet i have update the source and destination IP.
then i have recalculate the checksum for IP and UDP layer. then i have
to send that packet to network by using below command.

	NF_HOOK(PF_INET, NF_IP_LOCAL_OUT, skb, NULL, skb->dev, dst_output);
	ret = NF_STOLEN;
	return ret;

But after loading my module kernel hang when it receive any data from peer.

is there any other way to forward a packet to network after
modification of IP header/

Regards,
Padmalochan
